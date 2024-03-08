<?xml version="1.0" encoding='utf-8'?>

<!--******************************************************************************************************************

  Nombre:   Eduardo Ercilla
  Fecha:    07/03/2024
  Modulo:   Lenguaje de marcas y sistemas de gestión de la información (DAW)
  UD:       UD04 Transformación de datos.
  Tarea:    Tarea Evaluacion 02. XSLT.
  
  Descripcion del ejercicio:    El ejercicio pide transformar una serie de documentos htmls dados que forman una web
  								de un club de voleibol a diferentes archivos .xsl que recuperarán los datos de un
								archivo .xml dado.

*******************************************************************************************************************/
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main class="principal">

			<!-- Recorre los artículos de la tienda -->
          	<xsl:for-each select="tienda/articulo">
				<article>
					<section>

						<!-- Se añade una imagen en la ruta especificada y llamada como el valor de @foto -->
						<img class="articulo" src="../img/{./@foto}" alt="{./@foto}"/>			
					</section>
					<section>

						<!-- Muestra el precio de estos -->
						<h2><xsl:value-of select='./precio' /> €</h2>

						<!-- Cuenta el número de comentarios en este artículo-->
						<h3>Comentarios: <xsl:value-of select='count(comentarios)' /></h3> 

						<!-- Muestra los comentarios en una lista --> 
						<xsl:for-each select="comentarios">
							<ul>
								<li><xsl:value-of select='.'/></li>
							</ul>
						</xsl:for-each>
					</section>
				</article>
			</xsl:for-each>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>