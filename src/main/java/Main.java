import freemarker.template.Configuration;
import freemarker.template.Template;
import model.Estudiante;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args){
        {
            ProcessBuilder processBuilder = new ProcessBuilder();
            if (processBuilder.environment().get("PORT") != null) {
                port(Integer.parseInt(processBuilder.environment().get("PORT")));
            }else{
                port(8080);
            }

            ArrayList<Estudiante> lista = new ArrayList<Estudiante>();

            Configuration configuration = new Configuration(Configuration.VERSION_2_3_29);
            configuration.setClassForTemplateLoading(Main.class, "/");
            staticFiles.location("/public");

        //GET del main view

            get("/", (request, response) -> {
                Template template = configuration.getTemplate("views/Lista.ftl");
                Map<String, Object> mapList = new HashMap<>();
                StringWriter writer = new StringWriter();
                mapList.put("lista",lista);
                //READ
                template.process(mapList,writer);
                return  writer;
            });


            get("/formulario", (request, response) -> {

                    Template template = configuration.getTemplate("views/Formulario.ftl");
                    StringWriter writer = new StringWriter();
                    template.process(null,writer);

                    return  writer;

            });

            // CREATE
            post("/formulario", (request, response) -> {

                String matricula = request.queryParams("matricula");
                String nombre = request.queryParams("nombre");
                String apellido = request.queryParams("apellido");
                String telefono = request.queryParams("telefono");

                if(!(matricula.isEmpty() && nombre.isEmpty() && apellido.isEmpty() && telefono.isEmpty())){

                    Estudiante estudiante = new Estudiante(matricula,nombre,apellido,telefono);
                    lista.add(estudiante);
                    response.redirect("/");

                }
                return null;
            });

            get("/:matricula", (request, response) -> {

                Template template = configuration.getTemplate("views/Visualizacion.ftl");
                StringWriter writer = new StringWriter();
                Map<String, Object> mapList = new HashMap<>();
                String matricula = request.params("matricula");
                Estudiante est = new Estudiante();

                for (Estudiante e: lista) {
                    if(matricula.equals(e.getMatricula())){
                        est = e;
                    }

                }


                mapList.put("estudiante",est);


                template.process(mapList,writer);

                return  writer;
            });


            // UPDATE
            post("/editar", (request, response) -> {

                String matricula = request.queryParams("matricula");
                String nombre = request.queryParams("nombre");
                String apellido = request.queryParams("apellido");
                String telefono = request.queryParams("telefono");


                for (Estudiante est: lista) {
                    if(matricula.equals(est.getMatricula())){
                        est.setApellido(apellido);
                        est.setNombre(nombre);
                        est.setTelefono(telefono);
                        response.redirect("/");
                        System.out.println(matricula + "   "+ nombre);
                    }

                }


                return null;
            });


                         // DELETE
                post("/borrar/:matricula", (request, response) -> {

                    String matricula = request.params("matricula");

                    System.out.println(matricula);
                    for (Estudiante est: lista) {
                        if(matricula.equals(est.getMatricula())){
                            lista.remove(est);
                            response.redirect("/");
                            break;
                        }
                    }

                return null;
            });



        }
    }
}
