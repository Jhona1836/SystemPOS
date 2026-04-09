-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pos_sistema
CREATE DATABASE IF NOT EXISTS `pos_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pos_sistema`;

-- Volcando estructura para tabla pos_sistema.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.cache: ~0 rows (aproximadamente)
DELETE FROM `cache`;

-- Volcando estructura para tabla pos_sistema.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.cache_locks: ~0 rows (aproximadamente)
DELETE FROM `cache_locks`;

-- Volcando estructura para tabla pos_sistema.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_nombre_unique` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.categories: ~0 rows (aproximadamente)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
	(1, 'Lácteos', 'Productos lácteos', 1, '2026-04-02 10:13:15', '2026-04-02 10:13:15'),
	(2, 'Limpieza', 'Artículos para el hogar y desinfectantes', 1, '2026-04-07 04:39:52', '2026-04-07 04:39:52');

-- Volcando estructura para tabla pos_sistema.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;

-- Volcando estructura para tabla pos_sistema.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.jobs: ~0 rows (aproximadamente)
DELETE FROM `jobs`;

-- Volcando estructura para tabla pos_sistema.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.job_batches: ~0 rows (aproximadamente)
DELETE FROM `job_batches`;

-- Volcando estructura para tabla pos_sistema.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.migrations: ~1 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_03_06_032228_create_personal_access_tokens_table', 1),
	(5, '2026_03_10_023512_create_permission_tables', 1),
	(6, '2026_03_10_023845_add_fields_to_users_table', 1),
	(7, '2026_04_02_040201_create_categories_table', 1),
	(8, '2026_04_02_040202_create_products_table', 1);

-- Volcando estructura para tabla pos_sistema.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.model_has_permissions: ~0 rows (aproximadamente)
DELETE FROM `model_has_permissions`;

-- Volcando estructura para tabla pos_sistema.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.model_has_roles: ~0 rows (aproximadamente)
DELETE FROM `model_has_roles`;

-- Volcando estructura para tabla pos_sistema.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.password_reset_tokens: ~0 rows (aproximadamente)
DELETE FROM `password_reset_tokens`;

-- Volcando estructura para tabla pos_sistema.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.permissions: ~0 rows (aproximadamente)
DELETE FROM `permissions`;

-- Volcando estructura para tabla pos_sistema.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(2, 'App\\Models\\User', 1, 'pos-token', '34dbd2f2db09681e75bb2eb90e3e7cb37d3509a01738c1a014aab5cca8c5ebde', '["*"]', '2026-04-07 04:31:55', NULL, '2026-04-02 10:07:43', '2026-04-07 04:31:55'),
	(3, 'App\\Models\\User', 1, 'pos-token', 'b62ac41301677194aa8d897fd5e6de7f9f3b72f36387d0bcecfac5097dbc09ee', '["*"]', '2026-04-07 03:52:43', NULL, '2026-04-07 03:38:51', '2026-04-07 03:52:43'),
	(4, 'App\\Models\\User', 1, 'pos-token', '90bf8b09bf83c0ec94d48eb7ef1d74c06e6443ab2cfee08d8a66a30d5f7017fd', '["*"]', '2026-04-07 06:05:34', NULL, '2026-04-07 03:52:48', '2026-04-07 06:05:34'),
	(5, 'App\\Models\\User', 1, 'pos-token', 'ba5ec61d3598d478e89928ee0f080ac5ef93a6a51367afb74bfa5db9c231d58a', '["*"]', '2026-04-08 05:18:20', NULL, '2026-04-07 04:23:01', '2026-04-08 05:18:20'),
	(6, 'App\\Models\\User', 1, 'pos-token', '9543c3b50a88f0b44b68e226b4c739af47b8433ab04b570135f26ddb358cfdba', '["*"]', '2026-04-08 00:43:32', NULL, '2026-04-07 04:32:07', '2026-04-08 00:43:32'),
	(8, 'App\\Models\\User', 1, 'pos-token', '4221bb2911693f32c08df26e2c14bd808753af93556901499a919f4cff047e7e', '["*"]', '2026-04-08 01:06:10', NULL, '2026-04-08 00:44:03', '2026-04-08 01:06:10'),
	(10, 'App\\Models\\User', 1, 'pos-token', '9d9d035e3d8b292500f13b070f00c9076f5ad2841839605c8798bda57c3b53be', '["*"]', '2026-04-08 05:36:57', NULL, '2026-04-08 05:07:47', '2026-04-08 05:36:57'),
	(11, 'App\\Models\\User', 1, 'pos-token', '9280c725077028bb469e36f0bc3dc11dc768041e7ef5bcad46865ad4a451e708', '["*"]', '2026-04-08 05:47:33', NULL, '2026-04-08 05:46:57', '2026-04-08 05:47:33'),
	(12, 'App\\Models\\User', 1, 'pos-token', 'df3dfc5e8f467ea548463e391cf489e7904171feda2c883f59ab8d58f806c7dd', '["*"]', NULL, NULL, '2026-04-09 01:04:07', '2026-04-09 01:04:07'),
	(13, 'App\\Models\\User', 1, 'pos-token', '2e5b63f16b48ebd09d1502c893f6be7d94628c8bcd2e155e353a4e6ddd2eb45e', '["*"]', '2026-04-09 02:04:06', NULL, '2026-04-09 01:04:16', '2026-04-09 02:04:06');

-- Volcando estructura para tabla pos_sistema.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoBarras` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `precioVenta` decimal(12,2) NOT NULL,
  `precioCosto` decimal(12,2) NOT NULL DEFAULT '0.00',
  `stock` int NOT NULL DEFAULT '0',
  `stockMinimo` int NOT NULL DEFAULT '5',
  `unidad` enum('pieza','kg','litro','caja','paquete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pieza',
  `iva` enum('0','8','16') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '16',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  UNIQUE KEY `products_codigobarras_unique` (`codigoBarras`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.products: ~6 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `sku`, `codigoBarras`, `nombre`, `descripcion`, `precioVenta`, `precioCosto`, `stock`, `stockMinimo`, `unidad`, `iva`, `activo`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'LAC001', NULL, 'Leche entera 1L', NULL, 22.50, 18.00, 50, 10, 'litro', '16', 1, 1, '2026-04-02 10:18:31', '2026-04-02 10:18:31'),
	(2, 'PROD002', '7501234567891', 'Yogur Natural', 'Yogur natural sin azúcar 500ml', 18.50, 12.00, 80, 15, 'pieza', '16', 1, 1, '2026-04-08 00:57:05', '2026-04-08 00:57:05'),
	(3, 'LAC-CJ-LECH-005', '7501020304005', 'Caja Leche Deslactosada', 'Caja con 12 piezas de 1L c/u', 290.00, 210.00, 15, 2, 'caja', '16', 1, 1, '2026-04-08 00:59:22', '2026-04-08 00:59:22'),
	(4, 'LAC-YOGN-002', '7501020304002', 'Yogur Natural Gde', 'Yogur sin azúcar envase familiar', 48.00, 32.50, 50, 8, 'pieza', '16', 1, 1, '2026-04-08 01:02:36', '2026-04-08 01:02:36'),
	(6, 'LAC-QMAN-003', '7501020304003', 'Queso Manchego', 'Queso madurado para fundir', 180.00, 135.00, 20, 3, 'kg', '0', 1, 1, '2026-04-08 01:06:10', '2026-04-08 01:06:10'),
	(7, 'LAC-YOGN-005', '7501020304012', 'Yogur Fresa', 'Yogur sin azúcar envase familiar', 48.00, 32.50, 50, 8, 'pieza', '16', 1, 1, '2026-04-08 01:06:10', '2026-04-08 01:06:10');

-- Volcando estructura para tabla pos_sistema.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.roles: ~0 rows (aproximadamente)
DELETE FROM `roles`;

-- Volcando estructura para tabla pos_sistema.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.role_has_permissions: ~0 rows (aproximadamente)
DELETE FROM `role_has_permissions`;

-- Volcando estructura para tabla pos_sistema.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.sessions: ~0 rows (aproximadamente)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('WZ6n1St7TYHnA7xOZsZlePrfjykDpBllw8K5EQ2p', NULL, '127.0.0.1', 'Apidog/1.0.0 (https://apidog.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3VlQU9qTjZIYnpGN2FiWDRvWEpGU1lWUlpWUnRhMGNJQ2g4dzhZWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775588607);

-- Volcando estructura para tabla pos_sistema.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pin` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `ultimo_accesso` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_pin_unique` (`pin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pos_sistema.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `pin`, `activo`, `ultimo_accesso`) VALUES
	(1, 'Administrador', 'admin@tienda.com', NULL, '$2y$12$b9LxkgaQGsNuatoSIqXPJOS1LmhkZ0iHhfdnSF5WhxFaOEMCR6CB.', NULL, '2026-04-02 10:05:58', '2026-04-02 10:05:58', NULL, 1, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
