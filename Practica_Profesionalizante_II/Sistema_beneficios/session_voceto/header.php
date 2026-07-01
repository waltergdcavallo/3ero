<header>

     <!-- Encabezado -->       

      <div class="my-3 ms-3"><a href="index.php"><img src="imagenes/logo.png" alt="logo" id="img1"></a><span class="ms-5">Encabezado: Logo y Titulo</span></div>
            

       <!-- Menú de Navegación -->  
      <nav class="navbar navbar-expand-md navbar-light bg-light">
      <div class="container-fluid">
    
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
       <?php
        if (!isset($_SESSION["dniadmin"]) && !isset($_SESSION["dnicli"])){
       ?>
       <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="error404.php?pag=Institucional">Institucional</a>
        </li>
       <li class="nav-item">
          <a class="nav-link" href="error404.php?pag=Novedades">Novedades</a>
        </li>
       </ul>
        <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="formlogin.php">Ingreso</a>
        </li>	
        <li class="nav-item">
          <a class="nav-link" href="formRegister.php">Registrarme</a>
        </li>	
        </ul>
        <?php
        }elseif(isset($_SESSION["dniadmin"])){

        ?>
        <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="inicio_admin.php">Inicio Administrador</a>
        </li>
        </ul>
        <ul class="navbar-nav ms-auto">
        <div class="mt-2">
        <span class="text-danger">
          <?php echo "Administrador: ".$_SESSION["nombrecompletoadmin"] ?> 
        </span>
        </div>
        <li class="nav-item">
          <a class="nav-link" href="salir.php">Salir</a>
        </li>	
        
        </ul>
        <?php }elseif(isset($_SESSION["dnicli"])){ ?>

        <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="inicio_cli.php">Inicio Cliente</a>
        </li>
        </ul>
        <ul class="navbar-nav ms-auto">
        <div class="mt-2">
        <span class="text-primary">
          <?php echo "Cliente: ".$_SESSION["nombrecompletocli"] ?> 
        </span>
        </div>
        <li class="nav-item">
          <a class="nav-link" href="salir.php">Salir</a>
        </li>	
        
        </ul>

        <?php 
          } 
        ?>
      </div>
      </div>
      </nav>       
</header>
    
    