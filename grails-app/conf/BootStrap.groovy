import petrescue.*
import org.joda.time.*
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->

        // Usuarios

        HojaDeContacto hoja1 = new HojaDeContacto(nombre: "Susana", apellido: "Gimenez", telefono: "2020", email: "su@telefe.com.ar")
        Usuario usuario1 = new Usuario("la_su", "jazmin", hoja1)
        usuario1.save(failOnError: true)

        HojaDeContacto hoja2 = new HojaDeContacto(nombre: "Marcelo", apellido: "Tinelli", telefono: "13013", email: "marcetinelli@ideas.com")
        Usuario usuario2 = new Usuario("cuervotinelli", "12345", hoja2)
        usuario2.save(failOnError: true)

    	HojaDeContacto hoja3 = new HojaDeContacto(nombre: "Cristian", apellido: "Alvarez", telefono: "6380465", email: "pityviejaslo@hotmail.com")
    	Usuario usuario3 = new Usuario("elpity", "vamosviejaslo", hoja3)
    	usuario3.save(failOnError: true)

        // Mascotas

        Mascota mascota1 = new Mascota(especie: "gato", raza: "indeterminada", sexo: "macho", tamanio: "chico", edad: "", nombre: "", senias: "")
        Ubicacion ubicacion1 = new Ubicacion(provincia: "Capital Federal", barrio: "Almagro", calles: "")
        TipoAviso tipoAviso = TipoAviso.ENCONTRADO
        def fecha1 = new LocalDate()

        Path path = Paths.get("web-app/images/11.jpg");
        byte[] data = Files.readAllBytes(path);

        Aviso aviso1 = usuario1.publicarAviso(mascota1, fecha1 , ubicacion1, tipoAviso, "", data)
        aviso1.save(failOnError: true)

        // Aviso publicado por otro usuario distinto del logeado
        Mascota mascota2 = new Mascota(especie: "gato", raza: "indeterminada", sexo: "macho", tamanio: "chico", edad: "1", nombre: "Silvestre", senias: "")
        Ubicacion ubicacion2 = new Ubicacion(provincia: "Capital Federal", barrio: "Caballito", calles: "")
        TipoAviso tipoAviso2 = TipoAviso.PERDIDO
        def fecha2 = new LocalDate(2015, 4, 5)

        Path path2 = Paths.get("web-app/images/10.jpg");
        byte[] data2 = Files.readAllBytes(path2);

        Aviso aviso2 = usuario2.publicarAviso(mascota2, fecha2 , ubicacion2, tipoAviso2, "", data2)
        aviso2.save(failOnError: true)

        // Otra mascota
        Mascota mascota3 = new Mascota(especie: "perro", raza: "Golden Retriever", sexo: "macho", tamanio: "grande", edad: "3", nombre: "Carlos", senias: "")
        Ubicacion ubicacion3 = new Ubicacion(provincia: "Córdoba", barrio: "Villa Carlos Paz", calles: "")
        TipoAviso tipoAviso3 = TipoAviso.PERDIDO
        def fecha3 = new LocalDate(2015, 6, 5)

        Path path3 = Paths.get("web-app/images/3.jpg");
        byte[] data3 = Files.readAllBytes(path3);

        Aviso aviso3 = usuario3.publicarAviso(mascota3, fecha3 , ubicacion3, tipoAviso3, "Ayudenme! Lo extraño mucho!", data3)
        aviso3.save(failOnError: true)

        // Otra mascota
        Mascota mascota4 = new Mascota(especie: "perro", raza: "Golden Retriever", sexo: "macho", tamanio: "chico", edad: "0", nombre: "Lorenzo", senias: "es un cachorrito")
        Ubicacion ubicacion4 = new Ubicacion(provincia: "Capital Federal", barrio: "Belgrano", calles: "")
        TipoAviso tipoAviso4 = TipoAviso.PERDIDO
        def fecha4 = new LocalDate(2015, 7, 6)

        Path path4 = Paths.get("web-app/images/2.jpg");
        byte[] data4 = Files.readAllBytes(path4);

        Aviso aviso4 = usuario2.publicarAviso(mascota4, fecha4, ubicacion4, tipoAviso4, "Ofrezco toda mi fortuna!", data4)
        aviso4.save(failOnError: true)

        // Otra mascota
        Mascota mascota5 = new Mascota(especie: "gato", raza: "indeterminada", sexo: "macho", tamanio: "chico", edad: "1", nombre: "Tom", senias: "")
        Ubicacion ubicacion5 = new Ubicacion(provincia: "Capital Federal", barrio: "Abasto", calles: "")
        TipoAviso tipoAviso5 = TipoAviso.PERDIDO
        def fecha5 = new LocalDate()

        Path path5 = Paths.get("web-app/images/9.jpg");
        byte[] data5 = Files.readAllBytes(path5);

        Aviso aviso5 = usuario2.publicarAviso(mascota5, fecha5, ubicacion5, tipoAviso5, "", data5)
        aviso5.save(failOnError: true)

    }
    def destroy = {
    }
}
