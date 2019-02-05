@extends('frontend.layouts.master')

@section('content')
	<div class="container margin-top-20">
		<h3>My Cart Items</h3>
			@if(App\Models\Cart::totalItems() > 0)
			<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>No.</th>
					<th>Product Title</th>
					<th>Product Image</th>
					<th>Product Quantity</th>
					<th>Unit Price</th>
					<th>Sub Total Price</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				@php
					$total_price = 0;
				@endphp
				@foreach(App\Models\Cart::totalCarts() as $cart)
				<tr>
					<td>{{ $loop->index +1 }}</td>
					<td><a href="{{ route('products.show', $cart->product->slug) }}">{{ $cart->product->title }}</a></td>
					<td>
						@if($cart->product->images->count() > 0)
							<img src="{{ asset('images/products/'.$cart->product->images->first()->image) }}" width="50px">
						@endif
					</td>
					<td>
						<form class="form-inline" action="{{ route('carts.update', $cart->id) }}" method="post">
							@csrf
							<input type="number" name="product_quantity" class="form-control" value="{{ $cart->product_quantity }}" >
							<button type="submit" class="btn btn-info ml-2">update</button>
						</form>
					</td>
					<td>
						{{ $cart->product->price }}
					</td>
					<td>
						@php
							$total_price += $cart->product->price * $cart->product_quantity;
						@endphp
						{{ $cart->product->price * $cart->product_quantity }}
					</td>
					<td>
						<form class="form-inline" action="{{ route('carts.delete', $cart->id) }}" method="post">
							@csrf
							<button type="submit" class="btn btn-danger">Delete</button>
						</form>
					</td>
				</tr>
				@endforeach
				<tr>
					<td colspan="4"></td>
					<td>Total Amount:</td>
					<td colspan="2">
						<strong>{{ $total_price }} Taka</strong>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="cont-shopping">
			<div class="float-right">
			<a href="{{ route('products') }}" class="btn btn-info btn-lg">Continue Shopping...</a>
			<a href="{{ route('checkouts') }}" class="btn btn-warning btn-lg">Checkout</a>
			</div>
			@else
			<div class="alert alert-warning">
				<strong>There is no item in this cart</strong><br>
				<a href="{{ route('products') }}" class="btn btn-info btn-lg">Continue Shopping...</a>
			</div>
		</div>
		@endif
	</div>
@endsection