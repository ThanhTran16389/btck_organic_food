<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'user_id', 'order_number', 'sub_total', 'quantity',
        'delivery_charge', 'status', 'total_amount',
        'first_name', 'last_name', 'name', // <-- thêm vào đây
        'country', 'post_code', 'address1', 'address2',
        'phone', 'email', 'pay_method', 'pay_status',
        'shipping_id', 'coupon'
    ];

    public function cart_info()
    {
        return $this->hasMany(Cart::class, 'order_id', 'id');
    }

    public static function getAllOrder($id)
    {
        return Order::with('cart_info')->find($id);
    }

    public static function countActiveOrder()
    {
        $data = Order::count();
        if ($data) {
            return $data;
        }

        return 0;
    }

    public function cart()
    {
        return $this->hasMany(Cart::class);
    }

    public function shipping()
    {
        return $this->belongsTo(Shipping::class, 'shipping_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public static function countNewReceivedOrder()
    {
        $data = Order::where('status', 'new')->count();

        return $data;
    }

    public static function countProcessingOrder()
    {
        $data = Order::where('status', 'process')->count();

        return $data;
    }

    public static function countDeliveredOrder()
    {
        $data = Order::where('status', 'delivered')->count();

        return $data;
    }

    public static function countCancelledOrder()
    {
        $data = Order::where('status', 'cancel')->count();

        return $data;
    }
}