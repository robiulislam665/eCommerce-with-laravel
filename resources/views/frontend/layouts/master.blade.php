<!DOCTYPE html>
<html>
<head>
	<title>
		@yield('title', 'Online Ecommerce Shop')
	</title>
	@include('frontend.partials.styles')
</head>
<body>

	<div class="wrapper">

		{{-- Navigation Part--}}
			@include('frontend.partials.nav')
		{{-- End Navigation part --}}

		@include('frontend.partials.messages')



		{{-- sidebar+content part --}}
		
			@yield('content')

		{{-- End sidebar+content part --}}
		{{-- Footer part --}}
			@include('frontend.partials.footer')
		{{-- End Footer part --}}
	</div>
	{{-- all script part --}}
	@include('frontend.partials.script')
	@yield('scripts')
</body>
</html>