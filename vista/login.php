<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "skatelifesindatos2";
$conexion = new mysqli($host, $user, $pass, $db);
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
$mensaje = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $correo = $_POST['correo'];
  $contraseña = $_POST['contraseña'];
  $admin_email = 'admin@skaterlife.com';
  $admin_pass = '123456';
  if ($correo === $admin_email && $contraseña === $admin_pass) {
    $mensaje = "<div class='alert alert-success'>¡Bienvenido, Administrador!</div>";
    echo "<script>window.location.href='admin_dashboard.html';</script>";
  } else {
    echo "<div style='color:blue'>SQL ejecutado: $sql</div>";
    $sql = "SELECT * FROM tbl_usuario WHERE correo='$correo' AND contraseña='$contraseña'";
    $resultado = $conexion->query($sql);
    if ($resultado->num_rows == 1) {
      $mensaje = "<div class='alert alert-success'>Inicio de sesión exitoso.</div>";
      echo "<script>window.location.href='index.html';</script>";
    } else {
      $mensaje = "<div class='alert alert-danger'>Correo o contraseña incorrectos.</div>";
    }
  }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Iniciar Sesión - SkaterLife</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-5">
      <div class="bg-light p-4 rounded shadow-sm">
        <h3 class="text-center mb-4">Iniciar Sesión</h3>
        <?php if (!empty($mensaje)) echo $mensaje; ?>
        <form method="POST" action="">
          <!-- Eliminado selector de tipo de usuario -->
          <div class="form-group">
            <label for="correo">Correo electrónico</label>
            <input type="email" class="form-control" id="correo" name="correo" required>
          </div>
          <div class="form-group">
            <label for="clave">Contraseña</label>
            <input type="password" class="form-control" id="contraseña" name="contraseña" required>
          </div>
          <button type="submit" class="btn btn-primary btn-block">Entrar</button>
          <p class="text-center mt-3">¿No tienes cuenta? <a href="registrar.php">Regístrate</a></p>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>