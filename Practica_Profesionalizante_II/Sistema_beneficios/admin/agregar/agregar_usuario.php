<?php

require_once "conexion.php";

if(!empty($_POST['nombre']) && !empty($_POST['apellido']) && !empty($_POST['dni']) && !empty($_POST['telefono']) && !empty($_POST['email']) && !empty($_POST['direccion']) && !empty($_POST['password_hash']) && !empty($_POST['rol'])){

    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $dni=$_POST['dni'];
    $telefono=$_POST['telefono'];
    $email=$_POST['email'];
    $direccion=$_POST['direccion'];
    $password_hash=$_POST['password_hash'];
    $rol=$_POST['rol'];

    $sql="insert into usuario(nombre, apellido, dni, telefono, email, direccion, password_hash, rol) values(?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("ssssssss", $nombre, $apellido, $dni, $telefono, $email, $direccion, $password_hash, $rol);


    if ($stmt->execute()){
    header("Location:form_agregar_usuario.php?mensaje=ok");
    } else{
        $error.="Error en la inserción";
        header("Location:form_agregar_usuario.php?mensaje=".$error);
    }
}

?>