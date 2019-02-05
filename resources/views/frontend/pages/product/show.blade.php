@extends('frontend.layouts.master')

@section('title')
	{{ $product->title }} | Online Ecommerce Shop
@endsection

@section('content')
	<div class="container margin-top-20">
			<div class="row">
				<div class="col-md-3">
					{{--For slider --}}
					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner">
					  	@php $i = 1; @endphp
					   @foreach($product->images as $image)
					   	<div class="product-item carousel-item {{ $i == 1 ? 'active':'' }}">
					      <img class="d-block w-100" src="{!! asset('images/products/'.$image->image) !!}" alt="First slide">
					    </div>
					    @php $i++; @endphp
					   @endforeach
					    
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
					
					{{-- This code for show product wise category name & brand name --}}
					<div class="mt-3">
					 	<p>Category <span class="badge badge-info">{{ $product->category->name }}</span></p>
						<p>Brand <span class="badge badge-info">{{ $product->brand->name }}</span></p>

					</div>
					{{-- slider --}}
					
				</div>
				<div class="col-md-9">
					<div class="wedget">
						<h1>{{ $product->title }}</h1>
						<h3>{{ $product->price }} .Tk
							<span class="badge badge-primary">
								{{ $product->quantity < 1 ? 'No item is avilable' : $product->quantity.' item in stock' }}
							</span>
						</h3>
							<hr>
						<div class="product-description">
							{{ $product->description }}
						</div>
					</div>
				</div>
			</div>
		</div>
@endsection