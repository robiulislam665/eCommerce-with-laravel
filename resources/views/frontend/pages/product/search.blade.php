@extends('frontend.layouts.master')



@section('content')
	<div class="container margin-top-20">
			<div class="row">
				<div class="col-md-4">

					@include('frontend.partials.product-sidebar')
					
				</div>
				<div class="col-md-8">
					<div class="wedget">
						<h1>Searched Products For- <span class="badge badge-primary">{{ $search }}</span></h1>
						@include('frontend.pages.product.partials.all_products')
					</div>
				</div>
			</div>
		</div>
@endsection