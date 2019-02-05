<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Models\Category;

class Category extends Model
{
    public function parent(){
    	return $this->belongsTo(Category::class, 'parent_id');
    }

    public function products(){
    	return $this->hasMany(Product::class);
    }

//Check is the category is child category of that parent Category 
    public static function ParentOrNotCategory($parent_id, $child_id)
    {
    	$categories = Category::where('id', $child_id)->where('parent_id', $parent_id)->get();
    	if (!is_null($categories)) {
    		return true;
    	}else{
    		return false;
    	}
    }
}
