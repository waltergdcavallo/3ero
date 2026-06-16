<?php

require_once "conexion.php";

    $id_venta=$_POST['id_venta'];
    $monto=$_POST['monto'];
    $entregado=$_POST['entregado'];
    $pagado=$_POST['pagado'];
    $fecha_venta=$_POST['fecha_venta'];

    $sql="update venta set id_venta=?, entregado=?, pagado=?, fecha_venta=? where id_venta=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("ibbdi", $monto, $entregado, $pagado, $fecha_venta, $id_venta);


    if ($stmt->execute()){
    header("Location:form_editar_venta.php?mensaje=ok");
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_venta.php?mensaje=".$error);
}
?>