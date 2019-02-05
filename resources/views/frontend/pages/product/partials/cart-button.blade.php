
{{-- Cart button --}}

<form class="form-inline" action="{{ route('carts.store') }}" method="post">
	@csrf

	<input type="hidden" name="product_id" value="{{ $product->id }}">
	<button type="submit" class="btn btn-info button-position"><i class="fa fa-plus"></i> Add To Cart</button>
</form>
