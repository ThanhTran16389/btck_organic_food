<?php

namespace App\Http\Controllers;

use App\Models\PostCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PostCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $postCategory = PostCategory::orderBy('id', 'DESC')->paginate(10);

        return view('backend.postcategory.index')->with('postCategories', $postCategory);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.postcategory.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'string|required',
            'status' => 'required|in:active,inactive',
        ]);
        $data = $request->all();
        $slug = Str::slug($request->title);
        $count = PostCategory::where('slug', $slug)->count();
        if ($count > 0) {
            $slug = $slug.'-'.date('ymdis').'-'.rand(0, 999);
        }
        $data['slug'] = $slug;
        $status = PostCategory::create($data);
        if ($status) {
            request()->session()->flash('success', 'Post Category added');
        } else {
            request()->session()->flash('error', 'Please try again!!');
        }

        return redirect()->route('post-category.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $postCategory = PostCategory::findOrFail($id);

        return view('backend.postcategory.edit')->with('postCategory', $postCategory);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $postCategory = PostCategory::findOrFail($id);
        $this->validate($request, [
            'title' => 'string|required',
            'status' => 'required|in:active,inactive',
        ]);
        $data = $request->all();
        $status = $postCategory->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Post Category updated');
        } else {
            request()->session()->flash('error', 'Please try again!!');
        }

        return redirect()->route('post-category.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $postCategory = PostCategory::findOrFail($id);

        $status = $postCategory->delete();

        if ($status) {
            request()->session()->flash('success', 'Post Category deleted');
        } else {
            request()->session()->flash('error', 'Error while deleting post category');
        }

        return redirect()->route('post-category.index');
    }
}
