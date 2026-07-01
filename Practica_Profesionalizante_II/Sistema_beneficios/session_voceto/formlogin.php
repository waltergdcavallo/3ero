<?php

session_start();

if(isset($_SESSION["dniadmin"])){
    header ("Location:inicio_admin.php");
    
}elseif(isset($_SESSION["dnicli"])){
    header ("Location:inicio_cli.php");
  
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FORMULARIO LOGIN</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 
      <?php
        include('header.php');

      ?>
      
            
    
  <!-- Formulario de Inicio de Sesion que se utiliza para perfil Administrador y Cliente--> 
   
  <section>
  
  <div class="container mt-3 mb-5">
  <div class="row">
  <div class="col-12 col-md-2"></div>
  <div class="col-12 col-md-8">
  <div class="mt-5 text-center"><h3>Inicio de Sesión</h3></div>

  
  <form action="validarDatosAcceso.php" method="post">
  
  <div class="mb-3">
    <label for="dni" class="form-label">* DNI Usuario:</label>
    <input type="text" class="form-control" name="dni" id="dni" placeholder="Ingresa 8 dígitos Numéricos" pattern="[0-9]{8}" required>
  </div>
  <div class="mb-3">
    <label for="clave" class="form-label">* Clave:</label>
    <input type="password" class="form-control" name="clave" id="clave" minlength="8" placeholder="Ingresa contraseña de al menos 8 caracteres" required>
  </div>

  <div class="mb-5 pb-3">
     <label for="perfil" class="form-label">* Perfil</label>
     <select class="form-select" name="perfil" id="perfil" required>
            <option value="" disabled selected>Selecciona tu perfil</option>
            <option value="administrador">Administrador</option>
            <option value="cliente">Cliente</option>
     </select>
  </div>

  <div class="text-center mt-5 pt-5"><button type="submit" class="btn btn-primary" name="btn_ingresar" id="btn_ingresar">Ingresar</button></div>
  </form>
  
  
  <?php
    
    // Evalúa si existe error
    
    if (isset($_SESSION["error"])){
      
      echo "<div class='text-center mt-4 mb-5'><div class='alert alert-danger' role='alert'><strong>".htmlspecialchars($_SESSION["error"])."</strong></div></div>"; 
      
      unset($_SESSION["error"]);
   }
  ?> 


  <div class="col-12 col-md-2"></div>
  	
  </div>
  </div>
  </div>

  </section>

  <?php
    include('footer.php');
  ?>
   
   <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>