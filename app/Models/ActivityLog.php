<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    protected $fillable = ['user_id', 'activity'];

    public static function catat(string $activity): self
    {
        return static::create([
            'user_id' => auth()->id(),
            'activity' => $activity,
        ]);
    }
}
