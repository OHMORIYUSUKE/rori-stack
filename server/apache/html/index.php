<?PHP
$dsn = 'mysql:dbname=user02;host=mysql';
$user = 'user02';
$password = 'user02password';

try {
    $dbh = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    print('Error:' . $e->getMessage());
    die();
}

print("DB接続成功");
