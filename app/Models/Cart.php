<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Auth;

class Cart extends Model
{
    public $fillable = [
    	'user_id',
    	'ip_address',
    	'order_id',
    	'product_id',
    	'product_quantity'
    ];

    public function user()
    {
    	return $this->belongsTo(User::class);
    } 

    public function product()
    {
    	return $this->belongsTo(Product::class);
    }

    public function order()
    {
    	return $this->belongsTo(Order::class);
    }


/**
 * Total cart
 * return integer total cart model
 */
    public static function totalCarts()
    {
    	if (Auth::check()) {
    		$carts = Cart::where('user_id', Auth::id())
            ->where('order_id', NULL)
    		->get();
    	}else{
    		$carts = Cart::where('ip_address', request()->ip())->get();
    	}

    	return $carts;
    }


/**
 * Total Items in the cart
 * return integer total items
 */
    public static function totalItems()
    {
    	if (Auth::check()) {
    		$carts = Cart::where('user_id', Auth::id())
            ->where('order_id', NULL)
    		->get();
    	}else{
    		$carts = Cart::where('ip_address', request()->ip())->where('order_id', NULL)->get();
    	}

    	$total_item = 0;

    	foreach ($carts as $cart) {
    		$total_item += $cart->product_quantity;
    	}

    	return $total_item;
    }
}
