@extends('backend.layouts.master')




@section('content')
   <div class="main-panel">
      <div class="content-wrapper">
          <div class="card">
            <div class="card-header">
              Edit Category
            </div>
            <div class="card-body">
               <form action="{{ route('admin.category.update', $category->id) }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group">

                  @include('backend.partials.messages')
                  
                  <label for="text">Title</label>
                  <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp" value="{{ $category->name }}">
                </div>

                <div class="form-group">
                  <label for="description">Description(Optional)</label>
                  <textarea class="form-control" name="description" id="description">{{ $category->name }}</textarea>
                </div>
                <div class="form-group">
                  <label for="description">Parent Category(Optional)</label>
                  <select class="form-control" name="parent_id">
                    <option value="">Please a select primary category</option>
                    @foreach($main_categories as $cat)
                      <option value="{{$cat->id}}" {{ $cat->id == $category->parent_id ? 'selected' : '' }}>{{ $cat->name }}</option>
                    @endforeach
                  </select>
                </div>
                <div class="form-group">
                  <label for="image">Category Old Image</label><br>
                  <img src="{!! asset('images/categories/'.$category->image) !!}" width="100"><br>
                  <label for="image">Category New Image(Optional)</label>
                  <input type="file" name="image" class="form-control" id="image">
               </div>
            
                <button type="submit" class="btn btn-success
                ">Update Category</button>
              </form>
            </div>
          </div>
      </div>
   </div> 
      <!-- main-panel ends -->

@endsection