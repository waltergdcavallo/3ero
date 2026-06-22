<?php

require_once "conexion.php";

if(!empty($_POST['monto']) && !empty($_POST['entregado']) && !empty($_POST['pagado']) && !empty($_POST['fecha_venta']) && !empty($_POST['id_usuario']) && !empty($_POST['id_prducto']) && !empty($_POST['cant_prod']) && !empty($_POST['fecha_entrega'])){

    $monto=$_POST['monto'];
    $entregado=$_POST['entregado'];
    $pagado=$_POST['pagado'];
    $fecha_venta=$_POST['fecha_venta'];
    $id_usuario=$_POST['id_usuario'];

    $sql_venta="insert into venta(monto, entregado, pagado, fecha_venta, id_usuario) values(?, ?, ?, ?, ?)";

    $stmt_venta=$conex->prepare($sql);

    $stmt_venta->bind_param("ibbdi", $monto, $entregado, $pagado, $fecha_venta, $id_usuario);

    
    $id_venta=$_POST['id_venta'];
    $id_producto=$_POST['id_producto'];
    $cant_prod=$_POST['cant_prod'];
    $fecha_entrega=$_POST['fecha_entrega'];

    $sql_detalle="insert into detalle_venta(id_venta, id_producto, cant_prod, fecha_entrega) values(?, ?, ?, ?)";

    $stmt_detalle=$conex->prepare($sql);

    $stmt_detalle->bind_param("iiid", $id_venta, $id_producto, $cant_prod, $fecha_entrega);

    if ($stmt_venta->execute() && $stmt_detalle->execute()){
    header("Location:form_agregar_venta.php?mensaje=ok");
    } else{
        $error.="Error en la inserción";
        header("Location:form_agregar_venta.php?mensaje=".$error);
    }
    }

?>