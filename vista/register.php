<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Registrarse - SkaterLife</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-5">
      <div class="bg-light p-4 rounded shadow-sm">
        <h3 class="text-center mb-4">Registro</h3>
        <form method="POST" action="">
          <div class="form-group">
            <label for="numIde">Número de Identificación</label>
            <input type="number" class="form-control" id="numIde" name="numIde" required>
          </div>
          <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
          </div>
          <div class="form-group">
            <label for="apellidos">Apellidos</label>
            <input type="text" class="form-control" id="apellidos" name="apellidos" required>
          </div>
          <div class="form-group">
            <label for="fechaNacimiento">Fecha de Nacimiento</label>
            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
          </div>
          <div class="form-group">
            <label for="direccion">Dirección</label>
            <input type="text" class="form-control" id="direccion" name="direccion" required>
          </div>
          <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input type="number" class="form-control" id="telefono" name="telefono" required>
          </div>
          <div class="form-group">
            <label for="correo">Correo electrónico</label>
            <input type="email" class="form-control" id="correo" name="correo" required>
          </div>
          <div class="form-group">
            <label for="clave">Contraseña</label>
            <input type="password" class="form-control" id="clave" name="clave" required>
          </div>
          <button type="submit" class="btn btn-success btn-block">Registrarse</button>
          <p class="text-center mt-3">¿Ya tienes cuenta? <a href="login.php">Inicia sesión</a></p>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "skatelifesindatos2";
$conexion = new mysqli($host, $user, $pass, $db);
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $numIde   = $_POST['numIde'];
    $nombre   = $_POST['nombre'];
    $apellidos= $_POST['apellidos'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $direccion= $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $correo   = $_POST['correo'];
    $clave    = $_POST['clave'];
    $clave_encriptada = md5($clave);
    $sql = "INSERT INTO tbl_usuario (numIde, nombre, apellidos, fechaNacimiento, direccion, telefono, correo, contraseña) VALUES ('$numIde', '$nombre', '$apellidos', '$fechaNacimiento', '$direccion', '$telefono', '$correo', '$clave_encriptada')";
    if ($conexion->query($sql) === TRUE) {
      echo "<div class='alert alert-success text-center'>Usuario registrado correctamente. Redirigiendo...</div>";
      header("Refresh: 2; url=login.php");
      exit;
    } else {
        echo "<div class='alert alert-danger'>Error: " . $conexion->error . "</div>";
    }
}
?>