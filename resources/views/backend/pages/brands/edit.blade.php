@extends('backend.layouts.master')




@section('content')
   <div class="main-panel">
      <div class="content-wrapper">
          <div class="card">
            <div class="card-header">
              Edit Brand
            </div>
            <div class="card-body">
               <form action="{{ route('admin.brand.update', $brand->id) }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group">

                  @include('backend.partials.messages')
                  
                  <label for="text">Title</label>
                  <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp" value="{{ $brand->name }}">
                </div>

                <div class="form-group">
                  <label for="description">Description(Optional)</label>
                  <textarea class="form-control" name="description" id="description">{{ $brand->name }}</textarea>
                </div>

                <div class="form-group">
                  <label for="image">Brand Old Image</label><br>
                  <img src="{!! asset('images/brands/'.$brand->image) !!}" width="100"><br>
                  <label for="image">Brand New Image(Optional)</label>
                  <input type="file" name="image" class="form-control" id="image">
               </div>
            
                <button type="submit" class="btn btn-success">Update Brand</button>
              </form>
            </div>
          </div>
      </div>
   </div> 
      <!-- main-panel ends -->

@endsection