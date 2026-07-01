<?php

require_once "conexion.php";

mysqli_report(MYSQLI_REPORT_OFF);

if(!empty($_POST['dni']) && !empty($_POST['nombre']) && !empty($_POST['apellido']) && !empty($_POST['email']) && !empty($_POST['clave'])){

    $dni=$_POST['dni'];
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $email=$_POST['email'];
    $clave=$_POST['clave'];
    $tipo="cliente";

    $claveEncriptada=password_hash($clave, PASSWORD_DEFAULT);

    $sql="INSERT INTO usuario(dni, nombre, apellido, email, clave, tipo_usuario) VALUES(?, ?, ?, ?, ?, ?)";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("ssssss", $dni, $nombre, $apellido, $email, $claveEncriptada, $tipo);

    if($stmt->execute()){
        header("location:formlogin.php?mensaje=ok");
    } else{
        if($stmt->errno==1062){
            $error.="DNI ya existente";
            header("Location:formRegister.php?mensaje=".$error);
        }else{
            $error.="Error en la inserción";
            header("Location:formRegister.php?mensaje=".$error);
        }
    }
}


?>