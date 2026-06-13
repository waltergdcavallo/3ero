<?php

require_once "conexion.php";

    $id_beneficio=$_POST['id_beneficio'];
    $nombre=$_POST['nombre'];
    $fecha_inicio=$_POST['fecha_inicio'];
    $fecha_fin=$_POST['fecha_fin'];
    $estado=$_POST['estado'];
    $descripcion=$_POST['descripcion'];

    $sql="update beneficio set nombre=?, fecja_inicio=?, fecha_fin=?, estado=?, descripcion=? where id_beneficio=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("sdddsi", $nombre, $fecha_inicio, $fecha_fin, $estado, $descripcion, $id_beneficio);


    if ($stmt->execute()){
    header("Location:form_editar_beneficio.php?mensaje=ok");
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_beneficio.php?mensaje=".$error);
}


?>