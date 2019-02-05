@extends('frontend.layouts.master')


@section('content')
	<div class="container margin-top-20">
		<div class="card card-body">
			<h3>Confirmed Items</h3>
			<hr>
			<div class="row">
				<div class="col-md-7 border-right">
					@foreach(App\Models\Cart::totalCarts() as $cart)
					<p>
						{{ $cart->product->title }}
						-<strong>{{ $cart->product->price }} Tk.</strong>
						-<mark>{{ $cart->product_quantity }} items</mark>
					</p>
				@endforeach
				<a href="{{ route('carts') }}">Change cart Item</a>
				</div>
				<div class="col-md-5">
					@php
						$total_price = 0;
					@endphp
					@php
						$total_price = 0;
					@endphp
					@foreach(App\Models\Cart::totalCarts() as $cart)
					@php
						$total_price += $cart->product->price * $cart->product_quantity;
					@endphp
				@endforeach
				<p>Total Price :<strong> {{ $total_price }}</strong> Tk.</p>
				<p>Total Price With Shipping Cost: <strong>{{ $total_price + App\Models\Setting::first()->shipping_cost }}</strong> Tk.</p>
					
				</div>
			</div>	
		</div>

		<div class="card card-body mt-2">
			<h3>Shipping Address</h3>
		<form method="POST" action="{{ route('checkouts.store') }}">
            @csrf

            <div class="form-group row">
                <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Receiver Name') }}</label>

                <div class="col-md-6">
                    <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ Auth::check() ? Auth::user()->first_name.' '.Auth::user()->last_name : '' }}" required autofocus>

                    @if ($errors->has('name'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('name') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group row">
                <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                <div class="col-md-6">
                    <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ Auth::check() ? Auth::user()->email : '' }}" required>

                    @if ($errors->has('email'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('email') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group row">
                <label for="phone_no" class="col-md-4 col-form-label text-md-right">{{ __('Phone Number ') }}</label>

                <div class="col-md-6">
                    <input id="phone_no" type="text" class="form-control{{ $errors->has('phone_no') ? ' is-invalid' : '' }}" name="phone_no" value="{{ Auth::check() ? Auth::user()->phone_no : '' }}"" required>

                    @if ($errors->has('phone_no'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('phone_no') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group row">
                <label for="shipping_address" class="col-md-4 col-form-label text-md-right">{{ __('Shipping Address ') }}</label>

                <div class="col-md-6">
                    <textarea id="shipping_address" type="text" class="form-control{{ $errors->has('shipping_address') ? ' is-invalid' : '' }}" name="shipping_address" value="{{ Auth::check() ? Auth::user()->shipping_address : '' }}"></textarea>

                    @if ($errors->has('shipping_address'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('shipping_address') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group row">
                <label for="message" class="col-md-4 col-form-label text-md-right">{{ __(' Message ') }}</label>

                <div class="col-md-6">
                    <textarea id="message" type="text" class="form-control{{ $errors->has('message') ? ' is-invalid' : '' }}" name="message"></textarea>

                    @if ($errors->has('message'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('message') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group row">
                <label for="payment_method" class="col-md-4 col-form-label text-md-right">{{ __('Payment Method ') }}</label>

                <div class="col-md-6">
                	<select class="form-control" name="payment_method_id" required id="payments">
	                	<option value="">Select a payment method please</option>
                		@foreach($payments as $payment)
	                		<option value="{{ $payment->short_name }}">{{ $payment->name }}</option>
                		@endforeach
                	</select>
                	
                	@foreach($payments as $payment)
                		
                			@if($payment->short_name == "cash_in")
                			<div id="payment_{{ $payment->short_name }}" class="text-center mt-2 alert alert-success hidden">
                				<h4>For cash in there are nothing necessary.
                				<br/>
                				<small>You will get items in two or three days...click to finished</small>
                				</h4>
                			</div>
                			@else
                			<div id="payment_{{ $payment->short_name }}" class="text-center mt-2 alert alert-success hidden">
                				<h4>{{ $payment->name }} Payment</h4>
                				<p>
                					<strong>{{ $payment->name }} No : {{ $payment->no }}</strong>
                					<br>
                					<strong>Account Type : {{ $payment->type }}</strong>
                				</p>
                				<div>
                					Please sent the above money to this bkash no and write your transaction code in below...
                				</div>
                				
                			</div>

                		
                			@endif
                		
                	@endforeach
                	<input type="text" name="transaction_id" id="transaction_id" class="form-control hidden" placeholder="Enter your transaction Id">
            	</div>
            </div>


            <div class="form-group row mb-0">
                <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary">
                        {{ __('Order Now') }}
                    </button>
                </div>
            </div>
        </form>
			
		</div>
	</div>
@endsection
	
@section('scripts')

	<script type="text/javascript">
		$("#payments").change(function(){
			$payment_method = $("#payments").val();
			if($payment_method == "cash_in"){
				$("#payment_cash_in").removeClass('hidden');
				$("#payment_bkash").addClass('hidden');
				$("#payment_rocket").addClass('hidden');
			}else if($payment_method == "bkash"){
				$("#payment_bkash").removeClass('hidden');
				$("#payment_cash_in").addClass('hidden');
				$("#payment_rocket").addClass('hidden');
				$("#transaction_id").removeClass('hidden');
			}else if($payment_method == "rocket"){
				$("#payment_rocket").removeClass('hidden');
				$("#payment_bkash").addClass('hidden');
				$("#payment_cash_in").addClass('hidden');
				$("#transaction_id").removeClass('hidden');
			}
		});
	</script>
@endsection