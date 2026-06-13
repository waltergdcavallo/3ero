<?php

require_once "conexion.php";

if(!empty($_POST['nombre']) && !empty($_POST['precio']) && !empty($_POST['stock_inicial']) && !empty($_POST['stock_actual'])){

    $nombre=$_POST['nombre'];
    $precio=$_POST['precio'];
    $stock_inicial=$_POST['stock_inicial'];
    $stock_actual=$_POST['stock_actual'];

    $sql="insert into producto(nombre, precio, stock_inicial, stock_actual) values (?, ?, ?, ?)";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("siii", $nombre, $precio, $stock_inicial, $stock_actual);


    if ($stmt->execute()){
    header("Location:form_agregar_producto.php?mensaje=ok");
    } else{
        $error.="Error en la inserción";
        header("Location:form_agregar_producto.php?mensaje=".$error);
}
}

?>