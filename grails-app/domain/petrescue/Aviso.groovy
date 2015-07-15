package petrescue
import org.joda.time.*

class Mascota {
	String especie, raza, sexo, tamanio, nombre, senias, edad

	static constraints = {
		especie inList: ['perro', 'gato'], blank: false, nullable: false
		sexo inList: ['macho', 'hembra'], blank: false, nullable: false
		raza blank: true, nullable: true
		tamanio inList: ['chico', 'mediano', 'grande'], blank: false, nullable: false
		edad blank: true, nullable: true
		nombre blank: true, nullable: true
		senias blank: true, nullable: true
    }

    def razas(String especie){
      	if (especie == "perro"){
			['indeterminada', 'Affenpinscher', 'Afgano', 'Akita', 'Akita Americano', 'Alano Español', 'American Bully',
			'American Foxhound ', 'American Pit Bull Terrier', 'American Staffordshire Terrier', 'Australian Silky Terrier',
			'Azawakh', 'Barbet', 'Basenji', 'Basset Hound', 'Beagle', 'Bedlington Terrier', 'Berger de Picardie', 'Bichón Boloñés',
			'Bichón Frisé', 'Bichón Habanero', 'Bichon maltés', 'Billy', 'Black And Tan Coonhound', 'Bloodhound',
			'Bobtail', 'Bodeguero Andaluz', 'Border Collie', 'Border Terrier', 'Borzoi (galgo Ruso)', 'Boston Terrier', 'Bóxer',
			'Boyero Australiano', 'Boyero de Flandes', 'Boyero de las Ardenas', 'Braco alemán', 'Braco de Auvernia',
			'Braco del Ariège', 'Braco del Bourbonnais', 'Braco francés', 'Braco italiano', 'Braco San Germain', 'Breton', 'Briard',
			'Brittany', 'Broholmer', 'Buhund Noruego', 'Bull Terrier', 'Bull Terrier Miniatura', 'Bulldog', 'Bulldog americano',
			'Bulldog Francés', 'Bullmastín', 'Cane Corso', 'Caniche (o Poodle)', 'Carlino', 'Cavalier King Charles Spaniel', 'Chihuahua',
			'Chin Japonés', 'Chow Chow', 'Cirneco Del Etna', 'Clumber Spaniel', 'Cobrador de Nueva Escocia', 'Cocker Spaniel',
			'Cocker Spaniel Americano', 'Collie', 'Collie Barbudo', 'Collie Smooth ', 'Corgi Galés Cárdigan', 'Corgi Galés Pembroke',
			'Cotón de Tuléar', 'Curly Coated Retriever  (de pelo rizado)', 'Dálmata', 'Dandie Dinmont Terrier', 'Deerhound Escocés',
			'Doberman',	'Dogo Argentino', 'Dogo Canario', 'Dogo de Burdeos', 'Dogo Mallorquín', 'Drever', 'Epagneul breton', 'Eurasier',
			'Field Spaniel', 'Fila Brasileiro', 'Fila de San  Miguel', 'Fox Terrier', 'Foxhound Americano', 'Foxhound Inglés',
			'Galgo Italiano', 'Gascon Saintongeois', 'Golden Retriever', 'Gran Basset Grifón vendeano', 'Gran Danés', 'Greyhound',
			'Grifon Belga', 'Grifón de Bruselas', 'Hamilton Stovare', 'Harrier', 'Hokkaïdo ', 'Hovawart', 'Husky Siberiano',
			'Irish Soft Coated Wheaten Terrier', 'Jack Russell Terrier', 'Jamthund', 'Karjalankarhukoira ', 'Keeshond', 'Kerry Blue Terrier',
			'Kishu', 'Komondor', 'Korea Jinco Dog', 'Kromfohrländer', 'Kuvasz', 'Laïka de Siberia oriental', 'Laïka Ruso-Europeo',
			'Lakeland Terrier',	'Landseer', 'Lebrel Húngaro', 'Leonberger', 'Lhasa Apso', 'Lundehund noruego', 'Löwchen', 'Mastín',
			'Mastín Napolitano', 'Mastín Tibetano', 'Mestizo', 'Mudi ', 'Münsterländer', 'Papillon', 'Parson Russell Terrier',
			'Pastor Alemán', 'Pastor Australiano', 'Pastor Belga', 'Pastor Blanco Suizo', 'Pastor Catalán', 'Pastor de Anatolia',
			'Pastor de Beauce', 'Pastor de Los Pirineos', 'Pastor de Shetland', 'Pastor Polaco de Tierras Bajas',
			'Pequinés',	'Perdiguero de Burgos', 'Perdiguero de Drente', 'Perdiguero portugués', 'Perro boyero de Entlebuch',
			'Perro Crestado Chino', 'Perro de Agua', 'Perro de Canaan', 'Perro de Castro Laboreiro', 'Perro de Groenlandia',
			'Perro de Montaña Appenzell', 'Perro de Montaña Bernés', 'Perro de Montaña del Atlas', 'Perro de Montaña Gran Suizo',
			'Perro de pastor bergamasco', 'Perro de pastor de Asia Central', 'Perro de pastor de Karst',
			'Perro de pastor de Rusia Meridional', 'Perro de pastor del Cáucaso', 'Perro de Pastor islandés',
			'Perro de pastor polaco de las Llanuras', 'Perro de pastor polaco de Podhale','Perro de pastor portugués',
			'Perro de Pastor yugoslavo de Charplanina', 'Perro Esquimal Americano', 'Perro Esquimal Canadiense', 'Perro Lobo Checoslavaco',
			'Perro lobo de Sarloos', 'Perro Pastor Croato', 'Perro Pastor Mallorquín', 'Perro pastor Maremmano-Abruzzese',
			'Perro sin Pelo del Perú', 'Pinscher', 'Pinscher austriaco', 'Pinscher Miniatura', 'Plott Hound', 'Podenco Canario',
			'Podenco Ibicenco', 'Podenco Portugués', 'Pointer', 'Pointer Alemán de Pelo Corto', 'Pointer Alemán de Pelo Duro', 'Poitevin',
			'Pomerania','Porcelaine', 'Pudelpointer', 'Puli', 'Pumi', 'Rastreador de Hannover', 'Retriever de La Bahía de Chesapeake',
			'Ridgeback de Rodesia','Rottweiler', 'Sabueso Artesiano', 'Sabueso austriaco negro y fuego', 'Sabueso de Bosnia de pelo cerdoso',
			'Sabueso de Hygen','Sabueso de las Montañas de Montenegro', 'Sabueso de Smaland', 'Sabueso de Transilvania', 'Sabueso del Tirol',
			'Sabueso eslovaco', 'Sabueso español', 'Sabueso Estirio de pelo duro', 'Sabueso finlandes', 'Sabueso francés tricolor',
			'Sabueso Halden', 'Sabueso Italiano', 'Sabueso noruego', 'Sabueso polaco', 'Sabueso Schiller', 'Sabueso serbio', 'Sabueso suizo',
			'Sabueso tricolor serbio', 'Saluki (galgo Persa)', 'Samoyedo', 'San Bernardo', 'Schipperke', 'Schnauzer', 'Sealyham Terrier',
			'Setter Gordon', 'Setter Inglés', 'Setter Irlandés', 'Shar Pei', 'Shiba', 'Shih Tzu', 'Shikoku', 'Silky Terrier', 'Sin Raza o Mestizos',
			'Sloughi (galgo árabe)', 'Spaniel continental enano', 'Spaniel de Agua Irlandés', 'Spaniel de Pont-Audemer', 'Spaniel de Sussex',
			'Spaniel Picardo', 'Spaniel Tibetano', 'Spinone Italiano', 'Spitz Alemán',	'Spitz Finlandés', 'Spitz Japonés',
			'Springer Spaniel Galés', 'Springer Spaniel Inglés', 'Sptiz de Norrbotten', 'Stabyhoun', 'Staffordshire Bull Terrier',
			'Tchuvatch eslovaco', 'Teckel', 'Tejonero alpino', 'Tejonero de Westfalia', 'Terranova', 'Terrier Australiano', 'Terrier Brasileño',
			'Terrier cazador alemán', 'Terrier Cesky', 'Terrier de Airedale', 'Terrier de Norfolk', 'Terrier de Norwich', 'Terrier de Skye',
			'Terrier Escocés', 'Terrier Galés', 'Terrier Irlandés', 'Terrier japonés', 'Terrier Tibetano', 'Thai Ridgeback Dog ', 'Tosa Inu',
			'Valhund Sueco', 'Vizsla', 'Volpino Italiano', 'Waymaraner', 'West Highland White Terrier', 'Wetterhound', 'Wheaten Terrier',
			'Whippet', 'Wolfhound Irlandés', 'Yorkshire terrier']
    	}
      	else if (especie == "gato"){
			['indeterminada', 'Abisinio', "Aphrodite's Giants", 'Australian Mist', 'American Curl', 'Azul ruso', 'American shorthair',
			'American wirehair', 'Angora turco', 'Africano doméstico', 'Bengala', 'Bobtail japonés', 'Bombay', 'Bosque de Noruega',
			'Brazilian Shorthair', 'Brivon de pelo corto', 'Brivon de pelo largo', 'British Shorthair', 'Burmés', 'Burmilla', 'Cornish rexx',
			'California Spangled', 'Ceylon', 'Cymric', 'Chartreux', 'Deutsch Langhaar', 'Devon rex', 'Dorado africano', 'Don Sphynx', 'Dragon Li',
			'Europeo Común', 'Exótico de Pelo Corto', 'FoldEx', 'German Rex', 'Habana brown', 'Himalayo', 'Korat', 'Khao Manee', 'Lituli',
			'Maine Coon', 'Manx', 'Mau egipcio', 'Munchkin', 'Ocicat', 'Oriental', 'Oriental de pelo largo', 'Ojos azules', 'PerFold 1',
			'Persa Americano o Moderno', 'Persa Clásico o Tradicional 2', 'Peterbald', 'Pixie Bob', 'Ragdoll', 'Sagrado de Birmania', 'Scottish Fold',
			'Selkirk rex', 'Serengeti', 'Seychellois', 'Siamés', 'Siamés Moderno', 'Siamés Tradicional', 'Siberiano', 'Snowshoe', 'Sphynx', 'Tonkinés']
    	}
    }
}

class Ubicacion {
	String provincia, barrio, calles

	static constraints = {
		provincia blank:false, nullable: false
		barrio blank: false, nullable: false
		calles blank: true, nullable: true
    }

    def barrios(String provincia){
    	if (provincia == "Capital Federal"){
    		['Abasto', 'Agronomía', 'Almagro', 'Balvanera', 'Barrio Norte', 'Barracas',	'Belgrano', 'Boedo', 'Caballito',
			'Chacarita', 'Coghlan', 'Colegiales', 'Constitución', 'Flores', 'Floresta','La Boca', 'La Paternal', 'Liniers',
			'Mataderos', 'Monte Castro', 'Montserrat', 'Nueva Pompeya', 'Nuñez', 'Palermo', 'Palermo Viejo',
			'Parque Avellaneda', 'Parque Chacabuco', 'Parque Chas', 'Parque Patricios', 'Puerto Madero', 'Recoleta',
			'Retiro', 'Saavedra', 'San Cristóbal', 'San Nicolás', 'San Telmo', 'Versalles', 'Villa Crespo', 'Villa Devoto',
			'Villa General Mitre', 'Villa Lugano', 'Villa Luro', 'Villa Ortúzar', 'Villa Pueyrredón', 'Villa Real',
			'Villa Riachuelo', 'Villa Santa Rita', 'Villa Soldati',	'Villa Urquiza', 'Villa del Parque', 'Vélez Sarsfield']
    	}
    	else if (provincia == "GBA - Zona Norte"){
    		['Escobar', 'General San Martin', 'Jose C. Paz', 'Malvinas Argentinas', 'Pilar', 'San Fernando',
			'San Isidro', 'San Miguel', 'Tigre', 'Vicente Lopez']
    	}
    	else if (provincia == "GBA - Zona Sur"){
    		['Alejandro Korn', 'Almirante Brown', 'Avellaneda', 'Banfield', 'Berazategui', 'Coronel Brandsen', 
			'Esteban Echeverría', 'Ezeiza', 'Florencio Varela', 'Guerli', 'Guernica', 'La Plata', 'Lanús', 'Llavallol',
			'Lomas De Zamora', 'Quilmes', 'Remedios De Escalada', 'San Vicente', 'Temperley', 'Valentina Alsina']
    	}
    	else if (provincia == "GBA - Zona Oeste"){
    		['General Rodriguez', 'Hurlingham', 'Ituzaingo', 'La Matanza', 'Marcos Paz', 'Merlo', 
			'Moreno', 'Morón', 'Tres de Febrero']
    	}
    }
}

enum TipoAviso {
	PERDIDO, ENCONTRADO
}

enum EstadoAviso {
	PENDIENTE, FINALIZADO
}

class Aviso {

	TipoAviso tipoAviso
	Mascota mascota
	Usuario publicador
	LocalDate fecha
	Ubicacion ubicacion
	String comentario
	byte[] foto
	EstadoAviso estadoAviso 

	static embedded = ['mascota', 'ubicacion']

	static constraints = {
		tipoAviso nullable: false
		mascota nullable: false
		publicador nullable: false
		fecha nullable: false
		ubicacion nullable: false
		comentario blank: true, nullable: true
		foto maxSize: 1000000
		estadoAviso nullable: true
	}

	Aviso(Usuario publicador, Mascota mascota, LocalDate fecha, Ubicacion ubicacion, TipoAviso tipoAviso, String comentario, byte[] foto) {
		this.publicador = publicador
		this.mascota = mascota
		this.fecha = fecha
		this.ubicacion = ubicacion
		this.tipoAviso = tipoAviso
		this.comentario = comentario
		this.foto = foto
		this.estadoAviso = EstadoAviso.PENDIENTE
	}

	def tipoAvisoOpuesto(){
		switch (this.tipoAviso){
			case TipoAviso.ENCONTRADO:
				return TipoAviso.PERDIDO
				break

			case TipoAviso.PERDIDO:
				return TipoAviso.ENCONTRADO
				break
		}
	}

	def estadoAvisoOpuesto(){
		switch (this.estadoAviso){
			case EstadoAviso.PENDIENTE:
				return EstadoAviso.FINALIZADO
				break

			case EstadoAviso.FINALIZADO:
				return EstadoAviso.PENDIENTE
				break
		}
	}

	def modificarEstado(){
		this.estadoAviso = this.estadoAvisoOpuesto()
	}
}
