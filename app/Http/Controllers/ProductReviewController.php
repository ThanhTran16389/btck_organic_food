<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductReview;
use App\Models\User;
use App\Notifications\StatusNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;

class ProductReviewController extends Controller
{
    public function index()
    {
        $reviews = ProductReview::getAllReview();

        return view('backend.review.index')->with('reviews', $reviews);
    }

    public function create()
        {
            //
        // $review_product = ProductReview::get();
        // return view('frontend.pages.product_detail')->with('review_product', $review_product);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'rate' => 'required|numeric|min:1',
        ]);
        $product_info = Product::getProductBySlug($request->slug);
        //  return $product_info;
        $data = $request->all();
        $data['product_id'] = $product_info->id;
        $data['user_id'] = $request->user()->id;
        $data['status'] = 'active';
        $status = ProductReview::create($data);

        $user = User::all();
        // $user = User::where('role', 'admin')->get();
        $details = [
            'title' => 'New Product Rating!',
            'actionURL' => route('product-detail', $product_info->slug),
            'fas' => 'fa-star',
        ];
        Notification::send($user, new StatusNotification($details));
        if ($status) {
            request()->session()->flash('success', 'Thank you for your honest review!');
        } else {
            request()->session()->flash('error', 'Something went wrong! Please try again!!');
        }

        // return redirect()->back()->flash('success', 'Your review has been submitted!');
        return redirect()->back();
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $review = ProductReview::find($id);

        return view('backend.review.edit')->with('review', $review);
    }

    public function update(Request $request, $id)
    {
        $review = ProductReview::find($id);
        if ($review) {
            // $product_info=Product::getProductBySlug($request->slug);
            //  return $product_info;
            $data = $request->all();
            $status = $review->fill($data)->update();

            // $user=User::where('role','admin')->get();
            // $details=[
            //     'title'=>'Update Product Rating!',
            //     'actionURL'=>route('product-detail',$product_info->id),
            //     'fas'=>'fa-star'
            // ];
            // Notification::send($user,new StatusNotification($details));
            if ($status) {
                request()->session()->flash('success', 'Review updated');
            } else {
                request()->session()->flash('error', 'Something went wrong! Please try again!!');
            }
        } else {
            request()->session()->flash('error', 'Review not found!!');
        }

        return redirect()->route('review.index');
    }

    public function destroy($id)
    {
        $review = ProductReview::find($id);
        $status = $review->delete();
        if ($status) {
            request()->session()->flash('success', 'Review deleted');
        } else {
            request()->session()->flash('error', 'Something went wrong! Try again');
        }

        return redirect()->route('review.index');
    }
}