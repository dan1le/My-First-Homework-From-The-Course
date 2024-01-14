<?php

use Illuminate\Support\Facades\Route;

Route::view("/", "welcome");
Route::view("/about", "about");
Route::view("/shop", "shop");

// Route::get("/about", function (){
//     return view("about", [
//         "ime" => "Daks",
//         "prezime" => "Onfiric"
//     ]);
// });