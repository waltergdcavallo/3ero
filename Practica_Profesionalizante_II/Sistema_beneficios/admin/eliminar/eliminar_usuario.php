<?php
require_once "conexion.php";

$id_usuario=$_POST['id_usuario'];

$sql="delete from usuario where id_usuario=?";

$stmt=$conex->prepare($sql);

$stmt->bind_param("i", $id_usuario);

$stmt->execute();

header("Location: listado_usuarios.php");

?>