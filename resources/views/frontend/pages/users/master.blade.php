@extends('frontend.layouts.master')


@section('content')
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4">
				<div class="list-group">
					<a href="" class="list-group-item">
						<img src="{{ App\Helpers\ImageHelper::getUserImage(Auth::user()->id) }}" class="image rounded-circle" width="100px">
					</a>
					<a href="{{ route('user.dashboard') }}" class="list-group-item {{ route::is('user.dashboard') ? 'active' : '' }}">Dashboard</a>
					<a href="{{ route('user.profile') }}" class="list-group-item {{ route::is('user.profile') ? 'active' :'' }}">Update Profile</a>
					<a href="" class="list-group-item">Logout</a>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card caed-body">
					@yield('sub-content')
				</div>
			</div>
		</div>
	</div>


@endsection