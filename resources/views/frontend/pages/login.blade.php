@extends('frontend.layouts.master')

@section('title', 'Star Organic || Login Page')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="{{ route('home') }}">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="javascript:void(0);">Login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Login -->
<section class="shop login section fade-in">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-12">
                <div class="login-form glass-card">
                    <h2 class="text-center mb-4">Login</h2>
                    <!-- Form -->
                    <form class="form" method="post" action="{{ route('login.submit') }}">
                        @csrf
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Your Email<span>*</span></label>
                                    <input type="email" name="email" required value="{{ old('email') }}">
                                    @error('email')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative">
                                    <label>Your Password<span>*</span></label>
                                    <div class="password-wrapper">
                                        <input type="password" name="password" id="password" required>
                                        <span class="toggle-password" onclick="togglePassword()">
                                            <i class="fas fa-eye" id="eye-icon"></i>
                                        </span>
                                    </div>
                                    @error('password')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group button-group">
                                    <button class="btn" type="submit">Login</button>
                                    <a href="{{ route('register.form') }}" class="btn btn-google">Register</a>
                                </div>
                                <div class="checkbox mt-3">
                                    <label class="checkbox-inline" for="2">
                                        <input name="news" id="2" type="checkbox"> Remember me
                                    </label>
                                </div>
                                @if (Route::has('password.request'))
                                <a class="lost-pass" href="{{ route('password.reset.custom') }}">
                                    Lost your password?
                                </a>
                                @endif
                            </div>
                        </div>
                    </form>
                    <!--/ End Form -->
                </div>
            </div>
        </div>
    </div>
</section>
<!--/ End Login -->
@endsection

@push('styles')
<!-- Font Awesome for eye icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<style>
    body {
        background: url('{{ asset('images/bglogin.jpg') }}') no-repeat center center fixed;
        background-size: cover;
        font-family: 'Poppins', sans-serif;
        color: #333;
    }

    .glass-card {
        backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.85);
        padding: 35px 30px;
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
        transition: all 0.3s ease;
    }

    .glass-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.35);
    }

    .shop.login .form input[type="email"],
    .shop.login .form input[type="password"] {
        border-radius: 50px;
        padding: 12px 20px;
        border: 1px solid #ccc;
        transition: border 0.3s ease;
        width: 100%;
    }

    .shop.login .form input:focus {
        border-color: #4caf50;
        box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
    }

    .shop.login .form label {
        font-weight: 600;
        margin-bottom: 8px;
        display: block;
    }

    .shop.login .form .btn {
        background: linear-gradient(45deg, #4caf50, #8bc34a);
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 50px;
        transition: all 0.3s ease;
        text-align: center;
        white-space: nowrap;
        display: inline-block;
    }

    .shop.login .form .btn:hover {
        background: linear-gradient(45deg, #43a047, #7cb342);
        color: white;
    }

    .button-group {
        display: flex;
        justify-content: space-between;
        gap: 15px;
        margin-top: 20px;
    }

    .button-group .btn {
        flex: 1;
    }

    .btn-google {
        background: #ea4335;
        color: white;
    }

    .btn-google:hover {
        background: rgb(243, 26, 26) !important;
        color: white;
    }

    .fade-in {
        animation: fadeIn 1s ease;
    }

    @keyframes fadeIn {
        0% {
            opacity: 0;
            transform: translateY(15px);
        }

        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .password-wrapper {
        position: relative;
    }

    .password-wrapper input {
        padding-right: 45px;
        font-family: inherit;
        letter-spacing: 0.03em;
    }

    .toggle-password {
        position: absolute;
        top: 50%;
        right: 15px;
        transform: translateY(-50%);
        cursor: pointer;
        color: #666;
        font-size: 18px;
    }

    .toggle-password:hover {
        color: #000;
    }

</style>
@endpush

@push('scripts')
<script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const eyeIcon = document.getElementById('eye-icon');

        const isPassword = passwordInput.type === 'password';
        passwordInput.type = isPassword ? 'text' : 'password';

        eyeIcon.classList.toggle('fa-eye');
        eyeIcon.classList.toggle('fa-eye-slash');
    }
</script>
@endpush
