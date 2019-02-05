@extends('backend.layouts.master')




@section('content')
   <div class="main-panel">
      <div class="content-wrapper">
          <div class="card">
            <div class="card-header">
              Add Product
            </div>
            <div class="card-body">
              <form action="{{ route('admin.product.store') }}" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}
                <div class="form-group">

                  @include('backend.partials.messages')
                  
                  <label for="text">Title</label>
                  <input type="text" name="title" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Product Title">
                </div>

                <div class="form-group">
                  <label for="description">Description</label>
                  <textarea class="form-control" name="description" id="description"></textarea>
                </div>

                <div class="form-group">
                  <label for="number">Price</label>
                  <input type="number" name="price" class="form-control" id="price" aria-describedby="emailHelp" placeholder="Enter Product Price">
                </div>
                <div class="form-group">
                  <label for="number">Quantity</label>
                  <input type="number" name="quantity" class="form-control" id="quantity" aria-describedby="emailHelp" placeholder="Enter Product Quantity">
                </div>

                <div class="form-group">
                  <label for="number">Select Category</label>
                  <select class="form-control" name="category_id">
                    <option value="">Please select a category for a product</option>
                    @foreach(App\Models\Category::orderBy('name', 'asc')->where('parent_id', NULL)->get() as $parent)
                      <option value="{{ $parent->id }}">{{ $parent->name }}</option>
                      @foreach(App\Models\Category::orderBy('name', 'asc')->where('parent_id', $parent->id)->get() as $child)
                         <option value="{{ $child->id }}">----->{{ $child->name }}</option>
                      @endforeach
                    @endforeach
                  </select>
                </div>

                <div class="form-group">
                  <label for="number">Select Brand</label>
                  <select class="form-control" name="brand_id">
                    <option value="">Please select a brand for a product</option>
                    @foreach(App\Models\Brand::orderBy('name', 'asc')->get() as $brand)
                      <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                    @endforeach
                  </select>
                </div>

          <div class="form-group">
            <label for="product_image">Product Image</label>
            <div class="row">
              <div class="col-md-4">
                <input type="file" name="product_image[]" class="form-control" id="product_image">
              </div>
              <div class="col-md-4">
                <input type="file" name="product_image[]" class="form-control" id="product_image">
              </div>
              <div class="col-md-4">
                <input type="file" name="product_image[]" class="form-control" id="product_image">
              </div>
              <div class="col-md-4">
                <input type="file" name="product_image[]" class="form-control" id="product_image">
              </div>
              <div class="col-md-4">
                <input type="file" name="product_image[]" class="form-control" id="product_image">
              </div>
            </div>
          </div>
          

                <button type="submit" class="btn btn-primary">Add Product</button>
              </form>
            </div>
          </div>
      </div>
   </div> 
      <!-- main-panel ends -->

@endsection