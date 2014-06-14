<?php

$dsn      = 'mysql:dbname=world;host=10.2.2.8';
$user     = 'web';
$password = '';

try {
    $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}

$sql = 'SELECT * from City limit 5';

foreach ($pdo->query($sql) as $row) {
    var_dump($row);
    echo PHP_EOL . PHP_EOL;
}