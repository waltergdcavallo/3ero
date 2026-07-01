<?php

require_once "../../../conexion.php";

if(!empty($_POST['id_prducto']) && !empty($_POST['id_venta']) && !empty($_POST['cant_prod']) && !empty($_POST['fecha_entrega'])){

    $id_venta=$_POST['id_venta'];
    $id_producto=$_POST['id_producto'];
    $cant_prod=$_POST['cant_prod'];
    $fecha_entrega=$_POST['fecha_entrega'];

    $sql="insert into detalle_venta(id_venta, id_producto, cant_prod, fecha_entrega) values(?, ?, ?, ?)";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("iiid", $id_venta, $id_producto, $cant_prod, $fecha_entrega);

    if ($stmt->execute()){
        header("Location:form_agregar_venta.php?mensaje=ok");
    } else{
        $error.="Error en la inserción";
        header("Location:form_agregar_detalle.php?mensaje=".$error);
    }
}
