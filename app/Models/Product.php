<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    // protected $fillable = ['title', 'slug', 'summary', 'description', 'cat_id', 'child_cat_id', 'price', 'brand_id', 'discount', 'status', 'photo', 'size', 'stock', 'is_featured', 'condition'];
    protected $fillable = ['title', 'slug', 'summary', 'description','photo','stock', 'size','condition', 'status','price', 'discount', 'is_featured', 'cat_id', 'child_cat_id'];

    public function cat_info()
    {
        // return $this->hasOne(Category::class, 'id', 'cat_id'); // truy vấn tới bảng Category với khóa ngoại cat_id
        return $this->belongsTo(Category::class,'cat_id'); // cách viết xuôi chiều từ bảng cha xuống bảng con product thuộc category
    }

    public function sub_cat_info()
    {
        // return $this->hasOne(Category::class, 'id', 'child_cat_id');
        return $this->belongsTo(Category::class,'child_cat_id');
    }

    public static function getAllProduct()
    {
        return Product::with(['cat_info', 'sub_cat_info'])->orderBy('id', 'desc')->paginate(10); //tải quan hệ liên kết với hai hàm đã tạo liên kết ở trên
        // return Product::with(['cat_info', 'sub_cat_info'])->orderBy('id', 'desc')->get();
    }

    public function rel_prods()
    {
        return $this->hasMany(Product::class, 'cat_id', 'cat_id')->where('status', 'active')->orderBy('id', 'DESC')->limit(8);
    }

    public function getReview()
    {
        return $this->hasMany(ProductReview::class, 'product_id', 'id')->with('user_info')->where('status', 'active')->orderBy('id', 'DESC');
    }

    public static function getProductBySlug($slug)
    {
        // with sẽ lấy dữ liệu liên kết từ 3 hàm đã tạo ở trên
        return Product::with(['cat_info', 'rel_prods', 'getReview'])->where('slug', $slug)->first();
    }

    public static function countActiveProduct()
    {
        $data = Product::where('status', 'active')->count();
        if ($data) {
            return $data;
        }

        return 0;
    }

    public function carts()
    {
        return $this->hasMany(Cart::class)->whereNotNull('order_id');
    }

    public function wishlists()
    {
        return $this->hasMany(Wishlist::class)->whereNotNull('cart_id');
    }

    // public function brand()
    // {
    //     return $this->hasOne(Brand::class,'id','brand_id');
    // }
}
