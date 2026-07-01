<?php
// Iniciar sesion
session_start();

// Conexion con la Base de Datos
require_once "conexion.php";

// Guardar los datos enviados desde el formulario Login mediante método POST

$dni_usu=$_POST["dni"];
$clave_usu=$_POST["clave"];
$tipo_usu=$_POST["perfil"];
//var_dump($_POST);
//die();
/* Armar la sentencia SQL para encontrar, en la tabla usuario, el registro 
   correspondiente a los datos de acceso ingresados*/

$sql="Select * from usuario where dni=? and tipo_usuario=?";

// Preparar la sentencia SQL

$stmt=$conex->prepare($sql);

// Vincular las variables con los datos del formulario a la sentencia sql

$stmt->bind_param("ss",$dni_usu,$tipo_usu);

// Ejecutar la sentencia sql

$stmt->execute();

// Obtener el registro resultante de la ejecución de la sentencia sql

$result=$stmt->get_result();

if ($result->num_rows==1){

    // Guardar el registro como un arreglo asociativo en la variable $fila
    $fila=$result->fetch_assoc();

    if(!password_verify($clave_usu, $fila['clave'])){

        $_SESSION["error"]="Datos Incorrectos";   
        // Redirigir al Login
        header("Location:formlogin.php?");
        exit;
    }
    if ($fila["tipo_usuario"]=="administrador"){

        //Crear variables de sesión para el perfil administrador

        $_SESSION["dniadmin"]=$fila["dni"];
        $_SESSION["nombrecompletoadmin"]=$fila["nombre"]." ".$fila["apellido"] ;
        
    }elseif($fila["tipo_usuario"]=="cliente"){

        //Crear variables de sesión para el perfil cliente
    
        $_SESSION["dnicli"]=$fila["dni"];
        $_SESSION["nombrecompletocli"]=$fila["nombre"]." ".$fila["apellido"] ;

    }
        // Redirigir al Login
        header("Location:formlogin.php");
        exit;

}else{
    // Crea una variable de sesión de error
    $_SESSION["error"]="Datos Incorrectos";   
    // Redirigir al Login
    header("Location:formlogin.php?");
    exit;

}


?>