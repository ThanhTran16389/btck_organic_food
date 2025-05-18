<?php

namespace App\Http\Middleware;

use Closure;

class UserMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (empty(session('user'))) {
            return redirect()->route('login.form');
            // return redirect()->route('login.form',id); // cách truyền thêm đối số
        } else {
            return $next($request);
        }
    }
}