 <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Lista Estudiantes</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet"    href="css/bootstrap.css" >

    </head>

    <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <h1 class="navbar-brand">Listado de Estudiantes</h1>
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

    <table class="table">
        <thead class="thead-light">
        <tr>
            <th scope="col">Matricula</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Telefono</th>
            <th class="col-sm-1"></th>

        </tr>
        </thead>
        <tbody>
        <#list lista as estudiante>

            <tr>
                <td>
                    ${estudiante.matricula}
                </td>
                <td>
                    ${estudiante.nombre}
                </td>
                <td>
                    ${estudiante.apellido}
                </td>
                <td>
                    ${estudiante.telefono}
                </td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <form action="/${estudiante.matricula}" method="get">
                            <button type="submit" class="btn btn-secondary">Editar</button>
                        </form>

                        <form action="/borrar/${estudiante.matricula}" method="post">
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                        </form>
                    </div>
                </td>
            </tr>

        </#list>
        </tbody>
    </table>




    </body>

    </html>
