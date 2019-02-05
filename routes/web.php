<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','Frontend\PagesController@index')->name('index');

/*
 Product Routes
All the routes for products in front

*/
Route::group(['prefix' => 'products'], function(){
	Route::get('/','Frontend\ProductsController@index')->name('products');
	Route::get('/{slug}','Frontend\ProductsController@show')->name('products.show');
	Route::get('/new/search','Frontend\PagesController@search')->name('search');

	//Category route
	Route::get('/categories','Frontend\CategoriesController@index')->name('categories.index');
	Route::get('/category/{id}','Frontend\CategoriesController@show')->name('categories.show');
});

//User Routes 
Route::group(['prefix' => 'user'], function(){ 
	Route::get('/token/{token}','Frontend\VerificationController@verify')->name('user.varification');
	Route::get('/dashboard','Frontend\usersController@dashboard')->name('user.dashboard');
	Route::get('/profile','Frontend\usersController@profile')->name('user.profile');
	Route::post('/profile/update','Frontend\usersController@profileUpdate')->name('user.profile.update');

});

//User Carts Routes 
Route::group(['prefix' => 'carts'], function(){ 
	Route::get('/','Frontend\CartsController@index')->name('carts');
	Route::post('/store','Frontend\CartsController@store')->name('carts.store');
	Route::post('/update/{id}','Frontend\CartsController@update')->name('carts.update');
	Route::post('/delete/{id}','Frontend\CartsController@destroy')->name('carts.delete');

});

//checkouts Routes 
Route::group(['prefix' => 'checkouts'], function(){ 
	Route::get('/','Frontend\CheckoutsController@index')->name('checkouts');
	Route::post('/store','Frontend\CheckoutsController@store')->name('checkouts.store');

});



/*
 Admin Product Routes
All the Admin routes for products in front & backend

*/
Route::group(['prefix' => 'admin'], function(){
	Route::get('/','Backend\PagesController@index')->name('admin.index');

	//Admin login routes
	Route::get('/login','Auth\Admin\LoginController@showLoginForm')->name('admin.login');
	Route::post('/login/submit','Auth\Admin\LoginController@login')->name('admin.login.submit');
	Route::post('/logout/submit','Auth\Admin\LoginController@logout')->name('admin.logout');

	//Password Email Send
	Route::get('/password/reset','Auth\Admin\ForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
	Route::post('/password/email','Auth\Admin\ForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');

	//Password Reset
	Route::get('/password/reset/{token}','Auth\Admin\ResetPasswordController@showResetForm')->name('admin.password.reset');
	Route::post('/password/reset','Auth\Admin\ResetPasswordController@reset')->name('admin.password.reset.post');


//Product Route
Route::group(['prefix' => 'products'], function(){
	Route::get('/','Backend\ProductsController@index')->name('admin.products');
	Route::get('/create','Backend\ProductsController@create')->name('admin.product.create');
	Route::get('/edit/{id}','Backend\ProductsController@edit')->name('admin.product.edit');
	Route::post('/store','Backend\ProductsController@store')->name('admin.product.store');
	Route::post('product/edit/{id}','Backend\ProductsController@update')->name('admin.product.update');
	Route::post('product/delete/{id}','Backend\ProductsController@delete')->name('admin.product.delete');
	

	});

	//Orders Routes
Route::group(['prefix' => 'orders'], function(){
	Route::get('/','Backend\OrdersController@index')->name('admin.orders');
	Route::get('/view/{id}','Backend\OrdersController@show')->name('admin.order.show');
	Route::post('/delete/{id}','Backend\OrdersController@delete')->name('admin.order.delete');

	Route::post('/completed/{id}','Backend\OrdersController@completed')->name('admin.order.completed');
	Route::post('/paid/{id}','Backend\OrdersController@paid')->name('admin.order.paid');
	

	});

	//Categories Routes
Route::group(['prefix' => 'categories'], function(){
	Route::get('/','Backend\CategoriesController@index')->name('admin.categories');
	Route::get('/create','Backend\CategoriesController@create')->name('admin.category.create');
	Route::get('/edit/{id}','Backend\CategoriesController@edit')->name('admin.category.edit');
	Route::post('/store','Backend\CategoriesController@store')->name('admin.category.store');
	Route::post('category/edit/{id}','Backend\CategoriesController@update')->name('admin.category.update');
	Route::post('category/delete/{id}','Backend\CategoriesController@delete')->name('admin.category.delete');
	

	});

	//Bands Routes
Route::group(['prefix' => 'brands'], function(){
	Route::get('/','Backend\BrandsController@index')->name('admin.brands');
	Route::get('/create','Backend\BrandsController@create')->name('admin.brand.create');
	Route::get('/edit/{id}','Backend\BrandsController@edit')->name('admin.brand.edit');
	Route::post('/store','Backend\BrandsController@store')->name('admin.brand.store');
	Route::post('brand/edit/{id}','Backend\BrandsController@update')->name('admin.brand.update');
	Route::post('brand/delete/{id}','Backend\BrandsController@delete')->name('admin.brand.delete');
	

	});





});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
