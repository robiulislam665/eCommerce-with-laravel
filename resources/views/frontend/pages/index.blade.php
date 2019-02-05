@extends('frontend.layouts.master')


{{-- Home page sidebar+main content --}}
@section('content')
	<div class="container margin-top-20">
			<div class="row">
				<div class="col-md-3">
					@include('frontend.partials.product-sidebar')
					{{-- <div class="list-group">
					  <a href="#" class="list-group-item list-group-item-action">First item</a>
					  <a href="#" class="list-group-item list-group-item-action">Second item</a>
					  <a href="#" class="list-group-item list-group-item-action">Third item</a>
					</div> --}}
				</div>
				<div class="col-md-9">
					<div class="wedget">
						<h3 class="text-center" style="color: #0b0f82">All Products</h3>

						@include('frontend.pages.product.partials.all_products')

					</div>
				</div>
			</div>
		</div>
@endsection