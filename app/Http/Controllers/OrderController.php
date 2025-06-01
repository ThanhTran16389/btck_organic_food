<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Shipping;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Helpers\Helper;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        // ✅ Kiểm tra dữ liệu đầu vào
        $request->validate([
            'first_name'     => 'required|string|max:255',
            'last_name'      => 'required|string|max:255',
            'email'          => 'required|email|max:255',
            'phone'          => 'required|string|max:20',
            'address1'       => 'required|string|max:255',
            'address2'       => 'nullable|string|max:255',
            'post_code'      => 'nullable|string|max:20',
            'country'        => 'nullable|string|max:255',
            'shipping'       => 'nullable|integer|exists:shippings,id',
            'payment_method' => 'required|string|in:cod,paypal,cardpay',
        ]);

        // ✅ Gộp họ tên đầy đủ
        $name = trim($request->first_name . ' ' . $request->last_name);

        // ✅ Lấy giá shipping nếu có
        $shippingPrice = 0;
        if (!empty($request->shipping)) {
            $shippingPrice = Shipping::find($request->shipping)->price ?? 0;
        }

        // ✅ Lấy dữ liệu từ session/cart
        $subTotal    = Helper::totalCartPrice();
        $quantity    = Helper::cartCount();
        $couponValue = session('coupon')['value'] ?? 0;

        // ✅ Tính tổng tiền cuối cùng
        $totalAmount = max(0, $subTotal + $shippingPrice - $couponValue);

        // ✅ Trạng thái thanh toán
        $payStatus = in_array($request->payment_method, ['paypal', 'cardpay']) ? 'paid' : 'unpaid';

        // ✅ Dữ liệu đơn hàng
        $orderData = [
            'order_number' => 'ORD-' . strtoupper(Str::random(10)),
            'sub_total'    => $subTotal,
            'coupon'       => $couponValue,
            'total_amount' => $totalAmount,
            'quantity'     => $quantity,
            'pay_method'   => $request->payment_method,
            'pay_status'   => $payStatus,
            'status'       => 'new',
            'name'         => $name,
            'email'        => $request->email,
            'phone'        => $request->phone,
            'country'      => $request->country ?? '',
            'post_code'    => $request->post_code ?? '',
            'address1'     => $request->address1,
            'address2'     => $request->address2 ?? '',
            'user_id'      => auth()->id(),
            'shipping_id'  => $request->shipping,
        ];

        // ✅ Lưu vào cơ sở dữ liệu
        $order = Order::create($orderData);

        // TODO: Thêm xử lý order items nếu có

        // TODO: Xóa giỏ hàng hoặc session coupon nếu cần


            // Xử lý đơn hàng tại đây
            return redirect()->route('checkout')->with('order_success', 'Order placed successfully');
    }

}
