@extends('frontend.layouts.master')

@section('title','Star Organic || Register Page')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="{{route('home')}}">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="javascript:void(0);">Register</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Login -->
<section class="shop login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-12">
                <div class="login-form glass-card">
                    <h2 class="text-center mb-4">Register</h2>
                    <!-- Form -->
                    <form class="form" method="post" action="{{route('register.submit')}}">
                        @csrf
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Your Name<span>*</span></label>
                                    <input type="text" name="name" placeholder="" required="required" value="{{old('name')}}">
                                    @error('name')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Your Email<span>*</span></label>
                                    <input type="email" name="email" placeholder="" required="required" value="{{old('email')}}">
                                    @error('email')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Your Password<span>*</span></label>
                                    <input type="password" name="password" placeholder="" required="required">
                                    @error('password')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Confirm Password<span>*</span></label>
                                    <input type="password" name="password_confirmation" placeholder="" required="required">
                                    @error('password_confirmation')
                                        <span class="text-danger">{{$message}}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group button-group">
                                    <button class="btn" type="submit">Register</button>
                                    <a href="{{route('login.form')}}" class="btn btn-google">Back to Login</a>
                                </div>
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

    .shop.login .form input[type="text"],
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
</style>
@endpush
