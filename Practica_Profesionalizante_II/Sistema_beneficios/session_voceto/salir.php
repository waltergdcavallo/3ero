<?php
// Inicia la sesión
session_start();

// Borra todas las variables de sesión
session_unset();

// Destruye la sesión

session_destroy();

// Redirige al index
header("Location:index.php");



?>