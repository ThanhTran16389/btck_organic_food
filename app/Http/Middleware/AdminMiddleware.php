<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @return mixed
     */
    // 3 diều kiện của middleware là tên phía sau phải có Middleware
    // trong hàm phải có biến request và 
    public function handle(Request $request, Closure $next): Response
    {
        if ($request->user()->role == 'admin') { //kiểm tra ngườinày có phải the yêu cầu mới không

            return $next($request);
        } else {
            request()->session()->flash('error', 'You do not have any permission to access this page');

            return redirect()->route($request->user()->role);
        }
    }
}