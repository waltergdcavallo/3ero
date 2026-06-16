<?php
require_once "conexion.php";

$id_venta=$_POST['id_venta'];

$id_detalle_venta=$_POST['id_detalle_venta'];

$sql="delete from venta where id_venta=?";

$sql2="delete from detalle_venta where id_detalle_venta=?";

$stmt=$conex->prepare($sql);

$stmt->bind_param("i", $id_venta);

$stmt->execute();

$stmt2=$conex->prepare($sql2);

$stmt2->bind_param("i", $id_detalle_venta);

$stmt2->execute();

header("Location: listado_ventas.php");

?>