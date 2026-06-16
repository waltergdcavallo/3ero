<?php

require_once "conexion.php";

    $id_detalle_venta=$_POST['id_detalle_venta'];
    $id_producto=$_POST['id_producto'];
    $cant_prod=$_POST['cant_prod'];
    $fecha_entrega=$_POST['fecha_entrega'];

    $sql="update detalle_venta set id_producto=?, cant_prod=?, fecha_entrega=? where id_detalle_venta=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("iid", $id_producto, $cant_prod, $fecha_entrega, $id_detalle_venta);


    if ($stmt->execute()){
    header("Location:form_editar_detalle.php?mensaje=ok");
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_detalle.php?mensaje=".$error);
}
?>