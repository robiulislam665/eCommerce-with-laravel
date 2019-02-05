@extends('frontend.layouts.master')



@section('content')
	<div class="container margin-top-20">
			<div class="row">
				<div class="col-md-3">

					@include('frontend.partials.product-sidebar')
					
				</div>
				<div class="col-md-9">
					<div class="wedget">
						<h1>All Products in <span class="badge badge-info">{{ $category->name }} Category</span></h1>
						@php
							$products = $category->products()->paginate(9);
						@endphp

						@if($products->count() > 0)
							@include('frontend.pages.product.partials.all_products')
							@else
							<div class="alert alert-warning">
								No Product has added yet in this category!!
							</div>
						@endif	
					</div>
				</div>
			</div>
		</div>
@endsection