<?php
require_once "conexion.php";

$id_producto=$_POST['id_producto'];

$sql="delete from producto where id_producto=?";

$stmt=$conex->prepare($sql);

$stmt->bind_param("i", $id_producto);

$stmt->execute();

header("Location: listado_productos.php");

?>