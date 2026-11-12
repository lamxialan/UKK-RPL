<?php

use App\Models\Loan;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/laporan', function () {
    $loans = Loan::with(['user', 'tool'])->latest()->get();
    return view('laporan', compact('loans'));
})->middleware('auth');
