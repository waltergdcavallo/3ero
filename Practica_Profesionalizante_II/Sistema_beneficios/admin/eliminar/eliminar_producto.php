<?php
require_once "conexion.php";

$id_producto=$_POST['id_producto'];

$sql="delete from producto where id_producto=?";

$stmt=$conex->prepare($sql);

$stmt->bind_param("i", $id_producto);

$stmt->execute();

if ($stmt->execute()){
    header("Location:../listados/listado_productos.php?mensaje=ok");
    } else{
        $error.="Error en la eliminación";
        header("Location:../listados/listado_productos.php?mensaje=".$error);
    }

?>