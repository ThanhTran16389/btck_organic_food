<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ProductReview extends Model
{
    protected $fillable = ['user_id', 'product_id', 'rate', 'review', 'status'];

    public function user_info()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public static function getAllReview()
    {
        return ProductReview::with('user_info')->paginate(10);
    }

    public static function getAllUserReview()
    {
        return ProductReview::where('user_id', Auth::user()->id)->with('user_info')->paginate(10);
    }

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
}
