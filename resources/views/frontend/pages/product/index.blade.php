@extends('frontend.layouts.master')



@section('content')
	<div class="container margin-top-20">
			<div class="row">
				<div class="col-md-3">

					@include('frontend.partials.product-sidebar')
					
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