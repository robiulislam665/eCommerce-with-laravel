<div class="row">

	@foreach($products as $product)
		<div class="col-md-4 text-center hovr-row">
			<div class="card border-0 shadow-sm p-3 mb-2 bg-white rounded">
			{{-- <img class="card-img-top feature-img" src="{{ asset('images/products/'.'1_.jpg') }}" alt="Card image"> --}}
			@php $i = 1; @endphp

			@foreach($product->images as $image)
				@if($i > 0)
			  		<a href="{!! route('products.show', $product->slug) !!}">
			  			<img class="card-img-top feature-img" src="{{ asset('images/products/'. $image->image) }}" style="height: 200px; width: 150px;" alt="{{ $product->title }}">
			  		</a>
			  	@endif
			  @php $i--; @endphp
			  @endforeach

			  <div class="card-body">
			    <h4 class="card-title">
			    	<a href="{!! route('products.show', $product->slug) !!}">{{ $product->title }}</a>
			    </h4>
			    <p class="card-text">Price {{ $product->price }} Tk.</p>
			    @include('frontend.pages.product.partials.cart-button')
			  </div>
			</div>	
		</div>
	@endforeach

</div>
<div class="pagination text-center">
	{{ $products->links() }}
</div>