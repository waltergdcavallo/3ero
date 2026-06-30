<?php

require_once "../../../conexion.php";

    $id_venta=$_POST['id_venta'];
    $monto=$_POST['monto'];
    $entregado=$_POST['entregado'];
    $pagado=$_POST['pagado'];
    $fecha_venta=$_POST['fecha_venta'];

    $sql_venta="update venta set monto=?, entregado=?, pagado=?, fecha_venta=? where id_venta=?";

    $stmt_venta=$conex->prepare($sql);

    $stmt_venta->bind_param("ibbdi", $monto, $entregado, $pagado, $fecha_venta, $id_venta);


    if ($stmt_venta->execute()){
        
        $id_detalle_venta=$_POST['id_detalle_venta'];
        $id_producto=$_POST['id_producto'];
        $cant_prod=$_POST['cant_prod'];
        $fecha_entrega=$_POST['fecha_entrega'];
    
        $sql_detalle="insert into detalle_venta(id_venta, id_producto, cant_prod, fecha_entrega) values(?, ?, ?, ?)";
    
        $stmt_detalle=$conex->prepare($sql);
    
        $stmt_detalle->bind_param("iidi", $id_producto, $cant_prod, $fecha_entrega, $id_detalle_venta);

        if ($stmt_detalle->execute()){
            header("Location:form_editar_venta.php?mensaje=ok");
        } else{
            $error.="Error en la edición";
        header("Location:form_editar_venta.php?mensaje=".$error);
    }
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_venta.php?mensaje=".$error);
    }

?>