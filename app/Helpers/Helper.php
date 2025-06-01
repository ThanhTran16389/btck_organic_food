<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class Helper
{
    public static function totalCartPrice()
    {
        $cart = session()->get('cart');
        $total = 0;

        if ($cart) {
            foreach ($cart as $details) {
                $total += $details['price'] * $details['quantity'];
            }
        }

        return $total;
    }

    public static function cartCount()
    {
        $cart = session()->get('cart');
        $quantity = 0;

        if ($cart) {
            foreach ($cart as $details) {
                $quantity += $details['quantity'];
            }
        }

        return $quantity;
    }
}
