<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $fillable = ['sku', 'name', 'price', 'stock', 'category_id'];

    public function category(){
        //Asiganamos que un producto pertenece a una categoria
        return $this -> belongsTo(Category::class);
    }
}
