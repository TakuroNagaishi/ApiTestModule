<?php


$file_path = $argv[1];
$json_str = file_get_contents($file_path);
file_put_contents($file_path, json_encode(json_decode($json_str), JSON_PRETTY_PRINT));
