<?php

require_once "conexion.php";

if(!empty($_POST['monto']) && !empty($_POST['entregado']) && !empty($_POST['pagado']) && !empty($_POST['fecha_venta']) && !empty($_POST['id_usuario'])){

    $monto=$_POST['monto'];
    $entregado=$_POST['entregado'];
    $pagado=$_POST['pagado'];
    $fecha_venta=$_POST['fecha_venta'];
    $id_usuario=$_POST['id_usuario'];

    $sql="insert into venta(monto, entregado, pagado, fecha_venta, id_usuario) values(?, ?, ?, ?, ?)";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("ibbdi", $monto, $entregado, $pagado, $fecha_venta, $id_usuario);

    if ($stmt->execute()){
        header("Location:form_agregar_detalle.php?mensaje=ok");
    } else{
        $error.="Error en la inserción";
        header("Location:form_agregar_venta.php?mensaje=".$error);
    }
}

?>