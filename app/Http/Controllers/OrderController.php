<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Shipping;
use App\Models\User;
use App\Notifications\StatusNotification;
use Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Str;
use PDF;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::orderBy('id', 'DESC')->paginate(10);

        return view('backend.order.index')->with('orders', $orders);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'string|required',
            'last_name' => 'string|required',
            'address1' => 'string|required',
            'address2' => 'string|nullable',
            'coupon' => 'nullable|numeric',
            'phone' => 'numeric|required',
            'post_code' => 'string|nullable',
            'email' => 'string|required',
        ]);

        if (empty(Cart::where('user_id', auth()->user()->id)->where('order_id', null)->first())) {
            request()->session()->flash('error', 'Cart is Empty !');

            return back();
        }
        // $cart=Cart::get();
        // $cart_index='ORD-'.strtoupper(uniqid());
        // $sub_total=0;
        // foreach($cart as $cart_item){
        //     $sub_total+=$cart_item['amount'];
        //     $data=array(
        //         'cart_id'=>$cart_index,
        //         'user_id'=>$request->user()->id,
        //         'product_id'=>$cart_item['id'],
        //         'quantity'=>$cart_item['quantity'],
        //         'amount'=>$cart_item['amount'],
        //         'status'=>'new',
        //         'price'=>$cart_item['price'],
        //     );

        //     $cart=new Cart();
        //     $cart->fill($data);
        //     $cart->save();
        // }

        // $total_prod=0;
        // if(session('cart')){
        //         foreach(session('cart') as $cart_items){
        //             $total_prod+=$cart_items['quantity'];
        //         }
        // }

        $order = new Order;


        // $order_data = $request->all();
        // $order_data['order_number'] = 'ORD-'.strtoupper(Str::random(10));
        // $order_data['user_id'] = $request->user()->id;
        // $order_data['shipping_id'] = $request->shipping;
        // $shipping = Shipping::where('id', $order_data['shipping_id'])->pluck('price');
        // $order_data['sub_total'] = Helper::totalCartPrice();
        // $order_data['quantity'] = Helper::cartCount();
        // if (session('coupon')) {
        //     $order_data['coupon'] = session('coupon')['value'];
        // }
        // if ($request->shipping) {
        //     if (session('coupon')) {
        //         $order_data['total_amount'] = Helper::totalCartPrice() + $shipping[0] - session('coupon')['value'];
        //     } else {
        //         $order_data['total_amount'] = Helper::totalCartPrice() + $shipping[0];
        //     }
        // } else {
        //     if (session('coupon')) {
        //         $order_data['total_amount'] = Helper::totalCartPrice() - session('coupon')['value'];
        //     } else {
        //         $order_data['total_amount'] = Helper::totalCartPrice();
        //     }
        // }

         // Chỉ lấy những field tồn tại trong bảng `orders`
    $order_data = [
        'name'         => $request->first_name . ' ' . $request->last_name,
        'email'        => $request->email,
        'phone'        => $request->phone,
        'country'      => $request->country ?? 'N/A',
        'address1'     => $request->address1,
        'address2'     => $request->address2,
        'post_code'    => $request->post_code,
        'user_id'      => auth()->user()->id,
        'shipping_id'  => $request->shipping,
        'order_number' => 'ORD-'.strtoupper(Str::random(10)),
    ];

    // Tính toán các thông số liên quan đến giỏ hàng
    $shipping = Shipping::where('id', $order_data['shipping_id'])->pluck('price');
    $shipping_cost = $shipping[0] ?? 0;

    $sub_total = Helper::totalCartPrice();
    $quantity = Helper::cartCount();
    $coupon = session('coupon')['value'] ?? 0;

    $total_amount = $sub_total + $shipping_cost - $coupon;

    $order_data['sub_total']     = $sub_total;
    $order_data['quantity']      = $quantity;
    $order_data['coupon']        = $coupon;
    $order_data['total_amount']  = $total_amount;

        // $order_data['status']="new";
        // if(request('payment_method')=='paypal'){
        //     $order_data['payment_method']='paypal';
        //     $order_data['payment_status']='paid';
        // }
        // else{
        //     $order_data['payment_method']='cod';
        //     $order_data['payment_status']='Unpaid';
        // }
        if (request('pay_method') == 'paypal') {
            $order_data['pay_method'] = 'paypal';
            $order_data['pay_status'] = 'paid';
        } elseif (request('pay_method') == 'cardpay') {
            $order_data['pay_method'] = 'cardpay';
            $order_data['pay_status'] = 'paid';
        } else {
            $order_data['pay_method'] = 'cod';
            $order_data['pay_status'] = 'Unpaid';
        }
        $order->fill($order_data);
        $order->save();

    //     if ($order) {
    //         $users = User::where('role', 'admin')->first();
    //     }

    //     $details = [
    //         'title' => 'New Order Received',
    //         'actionURL' => route('order.show', $order->id),
    //         'fas' => 'fa-file-alt',
    //     ];
    //     Notification::send($users, new StatusNotification($details));
    //     if (request('payment_method') == 'paypal') {
    //         return redirect()->route('payment')->with(['id' => $order->id]);
    //     } else {
    //         session()->forget('cart');
    //         session()->forget('coupon');
    //     }
    //     Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);

    //     request()->session()->flash('success', 'Your product order has been placed. Thank you for shopping with us.');

    //     return redirect()->route('order.success');
    // }

    // Gửi thông báo cho admin
    $admin = User::where('role', 'admin')->first();
    if ($admin) {
        $details = [
            'title' => 'New Order Received',
            'actionURL' => route('order.show', $order->id),
            'fas' => 'fa-file-alt',
        ];
        Notification::send($admin, new StatusNotification($details));
    }

    // Nếu là paypal thì chuyển qua cổng thanh toán
    if ($request->payment_method === 'paypal') {
        return redirect()->route('payment')->with(['id' => $order->id]);
    }

    // Clear cart và coupon
    session()->forget('cart');
    session()->forget('coupon');

    // Gán order_id cho các item trong cart
    Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);

    session()->flash('show_success_modal', true);
    session()->flash('order_number', $order->order_number);
    session()->flash('order_total', $order->total_amount);

    return redirect()->route('checkout');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $order = Order::find($id);

        return view('backend.order.show')->with('order', $order);
    }

    public function edit($id)
    {
        $order = Order::find($id);

        return view('backend.order.edit')->with('order', $order);
    }

    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $this->validate($request, [
            'status' => 'required|in:new,process,delivered,cancel',
        ]);
        $data = $request->all();
        if ($request->status == 'delivered') {
            foreach ($order->cart as $cart) {
                $product = $cart->product;
                $product->stock -= $cart->quantity;
                $product->save();
            }
        }
        $status = $order->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Successfully updated order');
        } else {
            request()->session()->flash('error', 'Error while updating order');
        }

        return redirect()->route('order.index');
    }

    public function destroy($id)
    {
        $order = Order::find($id);
        if ($order) {
            $status = $order->delete();
            if ($status) {
                request()->session()->flash('success', 'Order Successfully deleted');
            } else {
                request()->session()->flash('error', 'Order can not deleted');
            }

            return redirect()->route('order.index');
        } else {
            request()->session()->flash('error', 'Order can not found');

            return redirect()->back();
        }
    }

    public function orderTrack()
    {
        $orders = Order::orderBy('id', 'DESC')->paginate(10);
        return view('frontend.pages.order-track')->with('orders', $orders);
    }

    public function productTrackOrder(Request $request)
    {
        $order = Order::where('user_id', auth()->user()->id)->where('order_number', $request->order_number)->first();
        if ($order) {
            if ($order->status == 'new') {
                request()->session()->flash('success', 'Your order has been placed.');

                return redirect()->route('order.success');
            } elseif ($order->status == 'process') {
                request()->session()->flash('success', 'Your order is currently processing.');

                return redirect()->route('order.success');
            } elseif ($order->status == 'delivered') {
                request()->session()->flash('success', 'Your order has been delivered. Thank you for shopping with us.');

                return redirect()->route('order.success');
            } else {
                request()->session()->flash('error', 'Sorry, your order has been canceled.');

                return redirect()->route('order.success');
            }
        } else {
            request()->session()->flash('error', 'Invalid order number. Please try again!');

            return back();
        }
    }

    // PDF generate
    public function pdf(Request $request)
    {
        $order = Order::getAllOrder($request->id);
        $file_name = $order->order_number.'-'.$order->first_name.'.pdf';
        $pdf = PDF::loadview('backend.order.pdf', compact('order'));

        return $pdf->download($file_name);
    }

    // Income chart
    public function incomeChart(Request $request)
    {
        $year = \Carbon\Carbon::now()->year;
        $items = Order::with(['cart_info'])->whereYear('created_at', $year)->where('status', 'delivered')->get()
            ->groupBy(function ($d) {
                return \Carbon\Carbon::parse($d->created_at)->format('m');
            });
        $result = [];
        foreach ($items as $month => $item_collections) {
            foreach ($item_collections as $item) {
                $amount = $item->cart_info->sum('amount');
                $m = intval($month);
                isset($result[$m]) ? $result[$m] += $amount : $result[$m] = $amount;
            }
        }
        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $monthName = date('F', mktime(0, 0, 0, $i, 1));
            $data[$monthName] = (! empty($result[$i])) ? number_format((float) ($result[$i]), 2, '.', '') : 0.0;
        }

        return $data;
    }
    public function success(Request $request)
    {
        $orderNumber = session('order_number'); // Nếu truyền qua session
        // $orders = Order::orderBy('id', 'DESC')->paginate(10); //lấy nhiều đơn
        // $order=Order::latest()->first(); //lấy 1 đơn mới nhất
        $order = Order::where('user_id', auth()->user()->id)->where('order_number', $orderNumber)->first();
        return view('frontend.pages.order-success')->with('order', $order);
        // return view('frontend.pages.order-success');
    }
}