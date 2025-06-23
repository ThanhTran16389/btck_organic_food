@extends('frontend.layouts.master')

@section('title', 'Ecommerce Laravel || Order Track Page')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{ route('home') }}">Home<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0);">Order Track</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <section class="tracking_box_area section_gap py-5">
        <div class="container">
            <div class="tracking_box_inner">
                <p>To track your order please enter your Order Number in the box below and click the "Track" button. This
                    was given
                    to you on your receipt and in the confirmation email you should have received or you can get your order
                    id from your user dashboard.</p>
                <form class="row tracking_form my-4" action="{{ route('product.track.order') }}" method="post"
                    novalidate="novalidate">
                    @csrf
                    <div class="col-md-8 form-group">
                        <input type="text" class="form-control p-2" name="order_number"
                            placeholder="Enter your order number">
                    </div>
                    <div class="col-md-8 form-group">
                        <button type="submit" value="submit" class="btn submit_btn">Track Order</button>
                    </div>
                </form>
                <div class="card-body">
                    <div class="table-responsive">
                        @if (count($orders) > 0)
                            <table class="table table-bordered table-hover" id="order-dataTable" width="100%"
                                cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Order No.</th>
                                        <th>Qty.</th>
                                        <th>Charge</th>
                                        <th>Status</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orders as $order)
                                        @php
                                            $shipping_charge = DB::table('shippings')
                                                ->where('id', $order->shipping_id)
                                                ->pluck('price');
                                        @endphp
                                        <tr>
                                            <td>{{ $order->id }}</td>
                                            <td>{{ $order->order_number }}</td>
                                            {{-- <td><a href="{{ route('order.success') }}">{{ $order->order_number }}</a></td> --}}
                                            {{-- route('product-sub-cat', [$cat_info->slug, $sub_menu->slug]) --}}
                                            <td>{{ $order->quantity }}</td>
                                            <td>
                                                @foreach ($shipping_charge as $data)
                                                    $ {{ number_format($data, 2) }}
                                                @endforeach
                                            </td>
                                            <td>
                                                @if ($order->status == 'new')
                                                    <span class="badge badge-primary">NEW</span>
                                                @elseif($order->status == 'process')
                                                    <span class="badge badge-warning">Processing</span>
                                                @elseif($order->status == 'delivered')
                                                    <span class="badge badge-success">Delivered</span>
                                                @else
                                                    <span class="badge badge-danger">{{ $order->status }}</span>
                                                @endif
                                            </td>
                                            <td>${{ number_format($order->total_amount, 2) }}</td>
                                            {{-- <td>
                                                <a href="{{ route('order.show', $order->id) }}"
                                                    class="btn btn-warning btn-sm float-left mr-1"
                                                    style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip"
                                                    title="view" data-placement="bottom"><i class="fas fa-eye"></i></a>
                                                <a href="{{ route('order.edit', $order->id) }}"
                                                    class="btn btn-primary btn-sm float-left mr-1"
                                                    style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip"
                                                    title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                                                <form method="POST" action="{{ route('order.destroy', [$order->id]) }}">
                                                    @csrf
                                                    @method('delete')
                                                    <button class="btn btn-danger btn-sm dltBtn"
                                                        data-id={{ $order->id }}
                                                        style="height:30px; width:30px;border-radius:50%"
                                                        data-toggle="tooltip" data-placement="bottom" title="Delete"><i
                                                            class="fas fa-trash-alt"></i></button>
                                                </form>
                                            </td> --}}
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <span style="float:right">{{ $orders->links('pagination::bootstrap-4') }}</span>
                        @else
                            <h6 class="text-center">No orders found!!! Please order some products</h6>
                        @endif
                    </div>
                </div>

            </div>
        </div>
    </section>
@endsection
