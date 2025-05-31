<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $fillable = ['description','short_des', 'logo', 'photo', 'address', 'phone', 'email'];
}
