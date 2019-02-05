@extends('backend.layouts.master')




@section('content')
   <div class="main-panel">
      <div class="content-wrapper">
          <div class="card">
            <div class="card-header">
              View Order #LE{{ $order->id }}
            </div>
            <div class="card-body">

              @include('backend.partials.messages')

              <div class="text-center">
                <h3 class="text-primary">Orderer Information</h3>
              </div>

              <div class="row border-right mt-2">
                <div class="col-md-6 border-right">
                  <p><strong>Orderer Name : </strong>{{ $order->name }}</p>
                  <p><strong>Orderer Phone No : </strong>{{ $order->phone_no }}</p>
                  <p><strong>Orderer Email : </strong>{{$order->email }}</p>
                  <p><strong>Orderer Shipping Address : </strong>{{ $order->shipping_address }}></p>
                </div>
                <div class="col-md-6">
                  <p><strong>Orderer Payment Method : </strong>{{ $order->payment->name }}</p>
                  <p><strong>Orderer Transaction ID : </strong>{{ $order->transaction_id }}</p>
                </div>
              </div>
              <hr>
    <div class="text-center">
      <h3 class="text-primary">Ordered Items:</h3>
    </div>
    <div>
      @if($order->carts->count() > 0)
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
        @foreach($order->carts as $cart)
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
    <form action="{{ route('admin.order.completed', $order->id) }}" method="post" class="form-inline" style="display:inline-block!important">
      @csrf
      @if($order->is_completed)
      <input type="submit" value="Cancel Order" class="btn btn-danger">
      @else
      <input type="submit" value="Complete Order" class="btn btn-success">
      @endif
    </form>

    <form action="{{ route('admin.order.paid', $order->id) }}" method="post" class="form-inline" style="display:inline-block!important">
      @csrf
      @if($order->is_paid)
      <input type="submit" value="Cancel Paynent" class="btn btn-danger">
      @else
      <input type="submit" value="Paid Order" class="btn btn-success">
      @endif
    </form>
    @endif
    </div>
            </div>
          </div>
      </div>
   </div> 
      <!-- main-panel ends -->

@endsection