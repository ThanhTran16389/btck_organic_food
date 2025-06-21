<?php

use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\UserMiddleware;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->web(append: [
            VerifyCsrfToken::class,
        ]);
        $middleware->api(append: [
            'throttle:60,1',
        ]);
        $middleware->alias([
            'bindings' => SubstituteBindings::class,
            'admin' => AdminMiddleware::class,
            'user' => UserMiddleware::class,
            // mình muốn khai báo thêm bao nhiêu midleware cũng đươc
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
