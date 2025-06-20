<!DOCTYPE html>
<html lang="zxx">

<head>
    @include('frontend.layouts.head')
    {{-- @stack('styles') --}}
</head>

<body class="js">

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- End Preloader -->

    @include('frontend.layouts.notification')

    <!-- Header -->
    @include('frontend.layouts.header')
    <!--/ End Header -->
    @yield('main-content')

    <!-- Chatzalo -->
    @include('frontend.layouts.chatcontact')

    @include('frontend.layouts.footer')

    @stack('scripts')


</body>

</html>
