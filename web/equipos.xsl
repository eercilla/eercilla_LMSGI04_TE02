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
		<meta charset="utf-8"/>
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
		
		<main>

			<!-- Guardamos el nombre elegido en una variable -->
			<xsl:variable name="Entrena" select="'Julio Velasco'"/>

			<!-- Aplicamos la plantilla para trabajar con el equipo del entrendador almacenado en la variable -->
			<xsl:apply-templates select="equipo[entrenador/nombre=$Entrena]" />
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- Plantilla para el recorrer el elemento equipo con el entrenador solicitado-->
<xsl:template match="equipo">

	<!-- Enlace con la URL dada en entrenador/elemento y que se visualizará en la web con el nombre del entrenador -->
	<h1><a href="{entrenador/url}"><xsl:value-of select='entrenador/nombre' /></a></h1>
	<article class="equipos">

		<!-- Muestra el nombre del equipo -->
		<h4><xsl:value-of select='nombre' /></h4>

		<!-- Aplicación de plantilla que recorrerá los elementos jugador titulares -->
		<xsl:apply-templates select="jugadores/jugador[@titular='si']" />
					
	</article>
</xsl:template>

<!-- Plantilla que recorra los elementos jugador -->
<xsl:template match="jugador">

	<!-- Muestra el dorsal de la camiseta y el nombre del jugador o jugadora -->
	<p><xsl:value-of select='./@camiseta' /> - <xsl:value-of select='./nombre' /></p>
</xsl:template>

</xsl:stylesheet>