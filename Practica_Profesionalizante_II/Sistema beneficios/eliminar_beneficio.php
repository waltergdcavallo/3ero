<?php
require_once "conexion.php";

$id_beneficio=$_POST['id_beneficio'];

$sql="delete from beneficio where id_beneficio=?";

$stmt=$conex->prepare($sql);

$stmt->bind_param("i", $id);

$stmt->execute();

header("Location: beneficios.php");

?>