@extends('frontend.pages.users.master')


@section('sub-content')
	<div class="container">
		<h3>Welcome {{ $user->first_name.' '.$user->last_name }}</h3>
		<p>You can change your profile and every information.</p>
	
		<hr>

		<div class="row">
			<div class="col-md-4">
				<div class="card card-body mb-2 pointer" onclick="location.href='{{ route('user.profile') }}'">
					<a href="{{ route('user.profile') }}">Update Profile</a>
				</div>
			</div>
		</div>
	</div>

@endsection