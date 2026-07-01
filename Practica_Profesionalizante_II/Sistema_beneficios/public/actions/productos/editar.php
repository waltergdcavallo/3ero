<?php

require_once "../../../conexion.php";

    $id_producto=$_POST['id_producto'];
    $nombre=$_POST['nombre'];
    $precio=$_POST['precio'];
    $stock_inicial=$_POST['stock_inicial'];
    $stock_actual=$_POST['stock_actual'];

    $sql="update producto set nombre=?, precio=?, stock_inicial=?, stock_actual=? where id_producto=?";

    $stmt=$conex->prepare($sql);

    $stmt->bind_param("siiii", $nombre, $precio, $stock_inicial, $stock_actual, $id_producto);


    if ($stmt->execute()){
    header("Location:form_editar_producto.php?mensaje=ok");
    } else{
        $error.="Error en la edición";
        header("Location:form_editar_producto.php?mensaje=".$error);
}
?>