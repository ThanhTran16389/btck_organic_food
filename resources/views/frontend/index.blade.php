@extends('frontend.layouts.master')
@section('title', 'Ecommerce Laravel || HOME PAGE')
@section('main-content')
    <!-- Slider Area -->
    @if (count($banners) > 0)
        <section id="Gslider" class="carousel slide" data-ride="carousel">
            {{-- class="carousel slide" data-ride="carousel" đang áp dụng bootstrap để tạo slide tự động --}}
            <ol class="carousel-indicators">
                {{-- class="carousel-indicators" tạo cách dấu gạch ngang điều khiển slide --}}
                @foreach ($banners as $key => $banner)
                    <li data-target="#Gslider" data-slide-to="{{ $key }}" class="{{ $key == 0 ? 'active' : '' }}">
                    </li>
                @endforeach

            </ol>
            {{-- phần insert baner chạy chính đầu trang --}}
            <div class="carousel-inner" role="listbox">
                @foreach ($banners as $key => $banner)
                    <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                        <img class="first-slide" src="{{ asset($banner->photo) }}" alt="First slide">
                        <div class="carousel-caption d-none d-md-block text-left">
                            {{-- d-none d-md-block ẩn trên màn hình điện thoại nhỏ và hiển thị trên màng hình trung và lớn --}}
                            <h1 class="wow fadeInDown">{{ $banner->title }}</h1>
                            {{-- <p>{!! html_entity_decode($banner->description) !!}</p> --}}
                            <p>{{ $banner->description }}</p>
                            <a class="btn btn-lg ws-btn wow fadeInUpBig" href="{{ route('product-grids') }}"
                                role="button">Shop Now<i class="far fa-arrow-alt-circle-right"></i></i></a>
                        </div>
                    </div>
                @endforeach
            </div>
            <a class="carousel-control-prev" href="#Gslider" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#Gslider" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </section>
    @endif

    <!--/ End Slider Area -->

    <!-- Start Small Banner  -->
    <section class="small-banner section">
        <div class="container-fluid">
            <div class="row">
                @if ($category_lists->count() > 0)
                    <div id="smallBannerSlider" class="carousel slide" data-ride="carousel" data-interval="3000">
                        {{-- <ol class="carousel-indicators">
                            @foreach ($category_lists as $key => $cat) --}}
                        {{-- take 3 lấy 3 sản phẩm đầu --}}
                        {{-- <li data-target="#smallBannerSlider" data-slide-to="{{ $key }}"
                                    class="{{ $key == 0 ? 'active' : '' }}"></li>
                            @endforeach
                        </ol> --}}
                        <div class="carousel-inner" role="listbox">
                            @foreach (collect($category_lists)->chunk(3) as $index => $chunk)
                                <div class="carousel-item {{ $index == 0 ? 'active' : '' }}">
                                    <div class="row">
                                        @foreach ($chunk as $cat)
                                            @if ($cat->is_parent == 1)
                                                <!-- Single Banner  -->
                                                <div class="col-lg-4 col-md-6 col-12">
                                                    <div class="single-banner">
                                                        @if ($cat->photo)
                                                            <img src="{{ asset($cat->photo) }}" alt="{{ $cat->title }}"
                                                                class="img-fluid">
                                                        @else
                                                            <img src="https://via.placeholder.com/600x370"
                                                                alt="{{ $cat->title }}" class="img-fluid">
                                                        @endif
                                                        <div class="content text-center mt-3">
                                                            <h3>{{ $cat->title }}</h3>
                                                            <a href="{{ route('product-cat', $cat->slug) }}"
                                                                class="btn btn-primary">Discover Now</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif
                                            <!-- /End Single Banner  -->
                                        @endforeach
                                    </div>
                                </div>
                            @endforeach

                        </div>
                        <!-- Controls -->
                        <a class="carousel-control-prev" href="#smallBannerSlider" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#smallBannerSlider" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </section>
    <!-- End Small Banner -->

    <!-- Start Product Area -->
    <div class="product-area section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>New Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="product-info">
                        <div class="nav-main">
                            <!-- Tab Nav -->
                            <ul class="nav nav-tabs filter-tope-group" id="myTab" role="tablist">
                                {{-- @php
                                    $categories = DB::table('categories')
                                        ->where('status', 'active')
                                        ->where('is_parent', 1)
                                        ->get();
                                @endphp --}}
                                @if ($category_lists)
                                    <button class="btn" style="background:#009450;">
                                        {{-- <button class="btn" style="background:#009450;"data-filter="*"> --}}
                                        Recently Added
                                    </button>
                                    @foreach ($category_lists as $key => $cat)
                                        <button class="btn"
                                            style="background:color:#8F8F8F;"data-filter=".{{ $cat->id }}">

                                            <a href="{{ route('product-cat', $cat->slug) }}">{{ $cat->title }}</a>

                                        </button>
                                    @endforeach
                                @endif
                            </ul>
                            <!--/ End Tab Nav -->
                        </div>
                        <div class="tab-content isotope-grid" id="myTabContent">
                            {{-- @php
                                $recentlyAddedProducts = DB::table('products')
                                    ->where('status', 'active')
                                    ->orderBy('created_at', 'desc')
                                    ->take(8) // Get the 8 most recently added products
                                    ->get();
                            @endphp --}}

                            @foreach ($recentlyAddedProducts as $key => $product)
                                <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item {{ $product->cat_id }}">
                                    <div class="single-product">
                                        <div class="product-img">
                                            <a href="{{ route('product-detail', $product->slug) }}">
                                                @php
                                                    $photos = explode(',', $product->photo);
                                                @endphp
                                                <img class="default-img" src="{{ asset($photos[0]) }}"
                                                    alt="{{ asset($photos[0]) }}">
                                                <img class="hover-img" src="{{ asset($photos[0]) }}"
                                                    alt="{{ asset($photos[0]) }}">
                                                @if ($product->stock <= 0)
                                                    <span class="out-of-stock">Out Of Stock</span>
                                                @elseif($product->condition == 'new')
                                                    <span class="new">New</span>
                                                @elseif($product->condition == 'hot')
                                                    <span class="hot">Hot</span>
                                                @else
                                                    <span class="price-dec">{{ $product->discount }}% Off</span>
                                                @endif
                                            </a>
                                            <div class="button-head">
                                                <div class="product-action">
                                                    <a data-toggle="modal" data-target="#{{ $product->id }}"
                                                        title="Quick View" href="#"><i
                                                            class="ti-eye"></i><span>Quick
                                                            Shop</span></a>
                                                    <a title="Wishlist"
                                                        href="{{ route('add-to-wishlist', $product->slug) }}"><i
                                                            class="ti-heart"></i><span>Add to Wishlist</span></a>
                                                </div>
                                                <div class="product-action-2">
                                                    <a title="Add to cart"
                                                        href="{{ route('add-to-cart', $product->slug) }}">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <h3><a
                                                    href="{{ route('product-detail', $product->slug) }}">{{ $product->title }}</a>
                                            </h3>
                                            @php
                                                // tính giá giảm sau discount
                                                $after_discount =
                                                    $product->price - ($product->price * $product->discount) / 100;
                                            @endphp
                                            <div class="product-price">
                                                <span>${{ number_format($after_discount, 2) }}</span>
                                                <del
                                                    style="padding-left: 4%;">${{ number_format($product->price, 2) }}</del>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Area -->

    <!-- Start Midium Banner  -->
    <section class="midium-banner">
        <div class="container">
            <div class="row">
                @if ($featured)
                    @foreach ($featured as $data)
                        <!-- Single Banner  -->
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="single-banner">
                                @php
                                    $photo = explode(',', $data->photo);
                                @endphp
                                <img src="{{ asset($photo[0]) }}" alt="{{ asset($photo[0]) }}">
                                <div class="content">
                                    <p>{{ $data->cat_info['title'] }}</p>
                                    <h3>{{ $data->title }} <br>Up to<span class="showdiscount">
                                            {{ $data->discount }}%</span></h3>
                                    <a href="{{ route('product-detail', $data->slug) }}">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <!-- /End Single Banner  -->
                    @endforeach
                @endif
            </div>
        </div>
    </section>
    <!-- End Midium Banner -->

    <!-- Start Most Popular -->
    <div class="product-area most-popular section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>Best Selling Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="owl-carousel popular-slider">
                        @foreach ($product_lists as $product)
                            @if ($product->condition == 'hot')
                                <!-- Start Single Product -->
                                <div class="single-product">
                                    <div class="product-img">
                                        <a href="{{ route('product-detail', $product->slug) }}">
                                            @php
                                                $photo = explode(',', $product->photo);
                                            @endphp
                                            <img class="default-img" src="{{ asset($photo[0]) }}"
                                                alt="{{ asset($photo[0]) }}">
                                            <img class="hover-img" src="{{ asset($photo[0]) }}"
                                                alt="{{ asset($photo[0]) }}">
                                            {{-- <span class="out-of-stock">Hot</span> --}}
                                        </a>
                                        <div class="button-head">
                                            <div class="product-action">
                                                <a data-toggle="modal" data-target="#{{ $product->id }}"
                                                    title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
                                                        Shop</span></a>
                                                <a title="Wishlist"
                                                    href="{{ route('add-to-wishlist', $product->slug) }}"><i
                                                        class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                            </div>
                                            <div class="product-action-2">
                                                <a href="{{ route('add-to-cart', $product->slug) }}">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <h3><a
                                                href="{{ route('product-detail', $product->slug) }}">{{ $product->title }}</a>
                                        </h3>
                                        <div class="product-price">
                                            <span class="old">${{ number_format($product->price, 2) }}</span>
                                            @php
                                                $after_discount =
                                                    $product->price - ($product->price * $product->discount) / 100;
                                            @endphp
                                            <span>${{ number_format($after_discount, 2) }}</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                            @endif
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Most Popular Area -->

    <!-- Start Shop Home List  -->
    <section class="shop-home-list section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="shop-section-title">
                                <h1>Latest Items</h1>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        {{-- @php
                            $product_lists = DB::table('products')
                                ->where('status', 'active')
                                ->orderBy('id', 'DESC')
                                ->limit(6)
                                ->get();
                        @endphp --}}
                        @foreach ($product_lists as $product)
                            <div class="col-md-4">
                                <!-- Start Single List  -->
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                @php
                                                    $photo = explode(',', $product->photo);
                                                @endphp
                                                <img src="{{ asset($photo[0]) }}" alt="{{ asset($photo[0]) }}">
                                                <a href="{{ route('add-to-cart', $product->slug) }}" class="buy"><i
                                                        class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h4 class="title"><a
                                                        href="{{ route('product-detail', $product->slug) }}">{{ $product->title }}</a>
                                                </h4>
                                                <p class="price with-discount">{{ number_format($product->discount, 2) }}%
                                                    OFF</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List  -->
                            </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Shop Home List  -->

    <!-- Start Shop Blog  -->
    <section class="shop-blog section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>From Our Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                @if ($posts)
                    @foreach ($posts as $post)
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Blog  -->
                            <div class="shop-single-blog">
                                <img src="{{ asset($post->photo) }}" alt="{{ asset($post->photo) }}">
                                <div class="content">
                                    <p class="date">{{ $post->created_at->format('d M , Y. D') }}</p>
                                    <a href="{{ route('blog.detail', $post->slug) }}"
                                        class="title">{{ $post->title }}</a>
                                    <a href="{{ route('blog.detail', $post->slug) }}" class="more-btn">Read More</a>
                                </div>
                            </div>
                            <!-- End Single Blog  -->
                        </div>
                    @endforeach
                @endif

            </div>
        </div>
    </section>
    <!-- End Shop Blog  -->

    <!-- Start Shop Services Area -->
    <section class="shop-services section home">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-rocket"></i>
                        <h4>Free shiping</h4>
                        <p>Orders over $100</p>
                    </div>
                    <!-- End Single Service -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-reload"></i>
                        <h4>Free Return</h4>
                        <p>Within 30 days returns</p>
                    </div>
                    <!-- End Single Service -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-lock"></i>
                        <h4>Sucure Payment</h4>
                        <p>100% secure payment</p>
                    </div>
                    <!-- End Single Service -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-tag"></i>
                        <h4>Best Peice</h4>
                        <p>Guaranteed price</p>
                    </div>
                    <!-- End Single Service -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Shop Services Area -->

    @include('frontend.layouts.newsletter')

    <!-- Modal -->
    @if ($product_lists)
        @foreach ($product_lists as $key => $product)
            <div class="modal fade" id="{{ $product->id }}" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    class="ti-close" aria-hidden="true"></span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row no-gutters">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <!-- Product Slider -->
                                    <div class="product-gallery">
                                        <div class="quickview-slider-active">
                                            @php
                                                $photo = explode(',', $product->photo);
                                            @endphp
                                            @foreach ($photo as $data)
                                                <div class="single-slider">
                                                    <img src="{{ asset($data) }}" alt="{{ asset($data) }}">
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    <!-- End Product slider -->
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div class="quickview-content">
                                        <h2>{{ $product->title }}</h2>
                                        <div class="quickview-ratting-review">
                                            <div class="quickview-ratting-wrap">
                                                <div class="quickview-ratting">
                                                    {{-- <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="fa fa-star"></i> --}}
                                                    @php
                                                        $rate = DB::table('product_reviews')
                                                            ->where('product_id', $product->id)
                                                            ->avg('rate');
                                                        $rate_count = DB::table('product_reviews')
                                                            ->where('product_id', $product->id)
                                                            ->count();
                                                    @endphp
                                                    @for ($i = 1; $i <= 5; $i++)
                                                        @if ($rate >= $i)
                                                            <i class="yellow fa fa-star"></i>
                                                        @else
                                                            <i class="fa fa-star"></i>
                                                        @endif
                                                    @endfor
                                                </div>
                                                <a href="#"> ({{ $rate_count }} customer review)</a>
                                            </div>
                                            <div class="quickview-stock">
                                                @if ($product->stock > 0)
                                                    <span><i class="fa fa-check-circle-o"></i> {{ $product->stock }} in
                                                        stock</span>
                                                @else
                                                    <span><i class="fa fa-times-circle-o text-danger"></i>
                                                        {{ $product->stock }} out stock</span>
                                                @endif
                                            </div>
                                        </div>
                                        @php
                                            $after_discount =
                                                $product->price - ($product->price * $product->discount) / 100;
                                        @endphp
                                        <h3><small><del
                                                    class="text-muted">${{ number_format($product->price, 2) }}</del></small>
                                            ${{ number_format($after_discount, 2) }} </h3>
                                        <div class="quickview-peragraph">
                                            <p>{!! html_entity_decode($product->summary) !!}</p>
                                        </div>
                                        @if ($product->size)
                                            <div class="size">
                                                <div class="row">
                                                    <div class="col-lg-6 col-12">
                                                        <h5 class="title">Size</h5>
                                                        <select>
                                                            @php
                                                                $sizes = explode(',', $product->size);
                                                            @endphp
                                                            @foreach ($sizes as $size)
                                                                <option>{{ $size }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    {{-- <div class="col-lg-6 col-12">
                                                        <h5 class="title">Color</h5>
                                                        <select>
                                                            <option selected="selected">orange</option>
                                                            <option>purple</option>
                                                            <option>black</option>
                                                            <option>pink</option>
                                                        </select>
                                                    </div> --}}
                                                </div>
                                            </div>
                                        @endif
                                        <form action="{{ route('single-add-to-cart') }}" method="POST" class="mt-4">
                                            @csrf
                                            <div class="quantity">
                                                <!-- Input Order -->
                                                <div class="input-group">
                                                    <div class="button minus">
                                                        <button type="button" class="btn btn-primary btn-number"
                                                            disabled="disabled" data-type="minus" data-field="quant[1]">
                                                            <i class="ti-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="hidden" name="slug" value="{{ $product->slug }}">
                                                    <input type="text" name="quant[1]" class="input-number"
                                                        data-min="1" data-max="1000" value="1">
                                                    <div class="button plus">
                                                        <button type="button" class="btn btn-primary btn-number"
                                                            data-type="plus" data-field="quant[1]">
                                                            <i class="ti-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <!--/ End Input Order -->
                                            </div>
                                            <div class="add-to-cart">
                                                <button type="submit" class="btn">Add to cart</button>
                                                <a href="{{ route('add-to-wishlist', $product->slug) }}"
                                                    class="btn min"><i class="ti-heart"></i></a>
                                            </div>
                                        </form>
                                        <div class="default-social">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    @endif
    <!-- Modal end -->
@endsection

@push('styles')
    {{-- 2 link này dùng cho styles slick của small banner --}}
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <style>
        #Gslider .carousel-inner {
            height: 550px;
        }

        #Gslider .carousel-inner img {
            width: 100% !important;
            height: 550px !important;
            object-fit: cover;
            opacity: .8;
        }

        #Gslider .carousel-inner .carousel-caption {
            bottom: 30%;
        }

        #Gslider .carousel-inner .carousel-caption h1 {
            font-size: 50px;
            font-weight: bold;
            line-height: 100%;
            /* color: #F7941D; */
            /* color: #1e1e1e; */
            color: #3D3D3D;
            -webkit-text-stroke: 1px #F5F5F5;
            /* Đường viền màu trắng, dày 1px */
            -webkit-text-fill-color: #3D3D3D;
            /* Màu nội dung chữ */
        }

        #Gslider .carousel-inner .carousel-caption p {
            font-size: 18px;
            color: #3D3D3D;
            margin: 10px 0 20px 0;
        }

        #Gslider .carousel-indicators {
            bottom: 10%;
        }
    </style>
@endpush

{{-- @push('script')
    <!-- Trước </body> dùng điều khiển small banner -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#smallBannerSlider').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                infinite: true,
                autoplay: true,
                autoplaySpeed: 3000,
                arrows: true,
                dots: true,
                responsive: [{
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 1
                        }
                    }
                ]
            });
        });
    </script>
@endpush --}}


@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        /*==================================================================
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            [ Isotope ]*/
        var $topeContainer = $('.isotope-grid');
        var $filter = $('.filter-tope-group');

        // filter items on button click
        $filter.each(function() {
            $filter.on('click', 'button', function() {
                var filterValue = $(this).attr('data-filter');
                $topeContainer.isotope({
                    filter: filterValue
                });
            });

        });

        // init Isotope
        $(window).on('load', function() {
            var $grid = $topeContainer.each(function() {
                $(this).isotope({
                    itemSelector: '.isotope-item',
                    layoutMode: 'fitRows',
                    percentPosition: true,
                    animationEngine: 'best-available',
                    masonry: {
                        columnWidth: '.isotope-item'
                    }
                });
            });
        });

        var isotopeButton = $('.filter-tope-group button');

        $(isotopeButton).each(function() {
            $(this).on('click', function() {
                for (var i = 0; i < isotopeButton.length; i++) {
                    $(isotopeButton[i]).removeClass('how-active1');
                }

                $(this).addClass('how-active1');
            });
        });
    </script>
    <script>
        function cancelFullScreen(el) {
            var requestMethod = el.cancelFullScreen || el.webkitCancelFullScreen || el.mozCancelFullScreen || el
                .exitFullscreen;
            if (requestMethod) { // cancel full screen.
                requestMethod.call(el);
            } else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
        }

        function requestFullScreen(el) {
            // Supports most browsers and their versions.
            var requestMethod = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el
                .msRequestFullscreen;

            if (requestMethod) { // Native full screen.
                requestMethod.call(el);
            } else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
            return false
        }
    </script>
@endpush
