<?php

return [
    App\Providers\AppServiceProvider::class,

    /*
     * Package Service Providers...
     */

    // unisharp
    // UniSharp\LaravelFilemanager\LaravelFilemanagerServiceProvider::class,
    // Intervention\Image\ImageServiceProvider::class,
    Barryvdh\DomPDF\ServiceProvider::class,
    Srmklive\PayPal\Providers\PayPalServiceProvider::class,
    Laravel\Socialite\SocialiteServiceProvider::class,
];
