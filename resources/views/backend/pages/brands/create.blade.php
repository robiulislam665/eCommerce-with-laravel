@extends('backend.layouts.master')




@section('content')
   <div class="main-panel">
      <div class="content-wrapper">
          <div class="card">
            <div class="card-header">
              Add Brand
            </div>
            <div class="card-body">
              <form action="{{ route('admin.brand.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group">

                  @include('backend.partials.messages')
                  
                  <label for="text">Title</label>
                  <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Product Name">
                </div>

                <div class="form-group">
                  <label for="description">Description</label>
                  <textarea class="form-control" name="description" id="description"></textarea>
                </div>

                <div class="form-group">
                  <label for="image">Brand Image</label>
                  <input type="file" name="image" class="form-control" id="image">
               </div>
            
                <button type="submit" class="btn btn-primary">Add Brand</button>
              </form>
            </div>
          </div>
      </div>
   </div> 
      <!-- main-panel ends -->

@endsection