<?php

require_once "conexion.php";

if(!empty($_POST['nombre']) && !empty($_POST['fecha_inicio']) && !empty($_POST['fecha_fin']) && !empty($_POST['estado']) && !empty($_POST['descripcion'])){

    $nombre=$_POST['nombre'];
    $fecha_inicio=$_POST['fecha_inicio'];
    $fecha_fin=$_POST['fecha_fin'];
    $estado=$_POST['estado'];
    $descripcion=$_POST['descripcion'];

    $sql="insert into beneficio(nombre, fecha_inicio, fecha_fin, estado, descripcion) values (?, ?, ?, ?, ?, ?)";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("sddbs", $nombre, $fecha_inicio, $fecha_fin, $estado, $descripcion);


    if ($stmt->execute()){
    header("Location:form_agregar_beneficio.php?mensaje=ok");
    } else{
        $error.="Error en la inserción";
        header("Location:form_agregar_beneficio.php?mensaje=".$error);
}
}

?>