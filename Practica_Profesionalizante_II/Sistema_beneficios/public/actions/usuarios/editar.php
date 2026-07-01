<?php

require_once "../../../conexion.php";

// admin
    $id_usuario=$_POST['id_usuario'];
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $dni=$_POST['dni'];
    $telefono=$_POST['telefono'];
    $email=$_POST['email'];
    $direccion=$_POST['direccion'];
    $password_hash=$_POST['password_hash'];
    $rol=$_POST['rol'];

    $sql="update usuario set nombre=?, apellido=?, dni=?, telefono=?, email=?, direccion=?, password_hash=?, rol=? where id_usuario=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("sssssssei", $nombre, $apellido, $dni, $telefono, $email, $direccion, $password_hash, $rol, $id_usuario);


    if ($stmt->execute()){
    header("Location:form_editar_usuario.php?mensaje=ok");
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_usuario.php?mensaje=".$error);
    }

// vendedor
    $id_usuario=$_POST['id_usuario'];
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $telefono=$_POST['telefono'];
    $direccion=$_POST['direccion'];
    $password_hash=$_POST['password_hash'];

    $sql="update usuario set nombre=?, apellido=?, telefono=?, direccion=?, password_hash=? where id_usuario=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("sssssi", $nombre, $apellido, $telefono, $direccion, $password_hash, $id_usuario);


    if ($stmt->execute()){
    header("Location:form_editar_usuario.php?mensaje=ok");
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_usuario.php?mensaje=".$error);
}
?>