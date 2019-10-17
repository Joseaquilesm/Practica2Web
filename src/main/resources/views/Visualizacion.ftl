<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agregar estudiante</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet"    href="css/bootstrap.css" >

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <h1 class="navbar-brand">Agregar estudiante</h1>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Lista
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/formulario">Agregar
                    <span class="sr-only">(current)</span>
                </a>
            </li>
        </ul>
    </div>
</nav>

<!-- Page Content -->

<form action="/editar" method="post" class="container"><br>
    <div class="shadow-lg p-3 mb-5 bg-white rounded">
        <div class="form-group">
            <label for="matricula">Matricula</label>
            <h2>${estudiante.matricula}</h2>
            <input type="hidden" class="form-control" name="matricula" id="matricula" value="${estudiante.matricula}">
        </div>
        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre" value="${estudiante.nombre}">
        </div>
        <div class="form-group">
            <label for="apellido">Apellido</label>
            <input type="text" class="form-control" name="apellido" id="apellido" value="${estudiante.apellido}">
        </div>
        <div class="form-group">
            <label for="telefono">Telefono</label>
            <input type="text" class="form-control" name="telefono" id="telefono" value="${estudiante.telefono}">
        </div>
        <div class="text-right">
            <button  type="submit" class="btn btn-primary">Editar estudiante</button>
        </div>
    </div>
</form>


</body>

</html>
