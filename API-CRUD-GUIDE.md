# Guía para crear una API REST CRUD en Laravel

Pasos para agregar un CRUD completo a una tabla nueva (ej: `payment_methods`, `sales`, `sale_items`, `business_info`).

---

## Arquitectura general

Una API CRUD en Laravel se compone de 3 piezas que trabajan juntas:

```
routes/api.php  →  define las URLs (RUTAS)
       ↓
Controlador    →  contiene la lógica de cada endpoint
       ↓
Modelo         →  representa la tabla y sus relaciones
```

---

## 1. Modelo — Representa la tabla en BD

```
php artisan make:model Models/NombreModelo
```

**Qué hace**: Es la capa que conecta PHP con la base de datos. Cada modelo equivale a una tabla.

**Lo que defines en él**:
- `$fillable` — campos que pueden asignarse masivamente (protección contra asignación masiva).
- `$casts` — cómo convertir tipos al leer/escribir (booleanos, decimales, etc.).
- Relaciones — `belongsTo()`, `hasMany()`, etc. (ej: un Sale pertenece a un User).
- Métodos personalizados — lógica de negocio específica (ej: `tieneStockBajo()`).

**Ejemplo**: `Product` → tabla `products`, `Category` → tabla `categories`.

---

## 2. Controlador — Contiene la lógica de cada endpoint

```
php artisan make:controller NombreModeloController
```

**Qué hace**: Recibe la petición HTTP, ejecuta la lógica y devuelve una respuesta JSON.

**Métodos (5 del CRUD)**:

| Método | HTTP | Qué hace |
|--------|------|----------|
| `index()` | `GET /api/recurso` | Lista todos los registros |
| `store()` | `POST /api/recurso` | Crea un nuevo registro (recibe datos del body) |
| `show()` | `GET /api/recurso/{id}` | Muestra un registro específico |
| `update()` | `PUT/PATCH /api/recurso/{id}` | Actualiza un registro existente |
| `destroy()` | `DELETE /api/recurso/{id}` | Elimina un registro |

**Cómo se enlaza al Modelo**:
- Al inicio del controlador: `use App\Models\NombreModelo;`
- En `show/update/destroy`: Laravel usa **Route Model Binding** — el type-hint `NombreModelo $variable` hace que Laravel busque automáticamente el registro por el ID de la URL.
- En `index/store`: se llama directamente al modelo (`NombreModelo::all()`, `NombreModelo::create()`).

---

## 3. routes/api.php — Define las URLs de la API

**Qué hace**: Mapea las URLs entrantes al controlador correspondiente.

```php
use App\Http\Controllers\NombreModeloController;

Route::apiResource('recurso', NombreModeloController::class);
```

**apiResource** genera 5 rutas automáticamente:

| Verbo | URL | Método del controlador |
|-------|-----|------------------------|
| GET | `/api/recurso` | `index()` |
| POST | `/api/recurso` | `store()` |
| GET | `/api/recurso/{recurso}` | `show()` |
| PUT/PATCH | `/api/recurso/{recurso}` | `update()` |
| DELETE | `/api/recurso/{recurso}` | `destroy()` |

Ejemplo real del proyecto (`routes/api.php`):
```php
Route::apiResource('categories', CategoryController::class);
Route::apiResource('products', ProductController::class);
```

---

## Flujo completo de una petición

```
Petición:  POST /api/products  {"nombre": "Laptop", "precioVenta": 15000}
     │
     ▼
routes/api.php  →  busca la ruta /api/products (POST)
     │
     ▼
ProductController@store()  →  recibe el Request, valida datos
     │
     ▼
Product::create(...)  →  inserta en la tabla products
     │
     ▼
response()->json(...)  →  devuelve JSON al cliente
```

---

## Orden sugerido para tus nuevas tablas

Dado el diagrama ER (tablas sin FK primero):

| Orden | Tabla | Recurso API |
|-------|-------|-------------|
| 1 | `payment_methods` | `/api/payment-methods` |
| 2 | `business_info` | `/api/business-info` |
| 3 | `sales` | `/api/sales` |
| 4 | `sale_items` | `/api/sale-items` |

---

## Buenas prácticas

- **Route Model Binding** — usa `show(MiModelo $modelo)` en vez de recibir `$id` y hacer `MiModelo::findOrFail($id)`.
- **API Resources** — para transformar la respuesta JSON (ej: ocultar campos, formatear fechas).
- **Form Requests** — para mover la validación a una clase separada si es muy compleja.
- **Proteger rutas** — usa middleware `auth:sanctum` para rutas que requieran autenticación.
