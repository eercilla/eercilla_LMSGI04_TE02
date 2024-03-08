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
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>

                <!-- Recorremos los partidos disputados en la ciudad de Lima -->
                <xsl:for-each select="partido[lugar/@ciudad='Lima']">
				<tr>
                    <!-- Añadimos los equipos local y visitante en la 1era celda y la fecha en la 2da -->
					<td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
					<td><xsl:value-of select="fecha"/></td>

                    <!-- Almacenamos los resultados en variables -->
                    <xsl:variable name="eq1" select="equipos/local/@puntuacion"/>
                    <xsl:variable name="eq2" select="equipos/visitante/@puntuacion"/>

          			<!-- Comparamos los resultados -->
                    <xsl:choose>
                        <!-- Resultado local > o igual que el resultado visitante -->
                        <xsl:when test="$eq2&lt;=$eq1">
                            <td><xsl:value-of select="$eq1"/> - <xsl:value-of select="$eq2"/></td>    
                        </xsl:when>
                        <!-- Resultado local < que el resultado visitante y aplica la clase "azul"-->
                        <xsl:otherwise>
                            <td class="azul"><xsl:value-of select="$eq1"/> - <xsl:value-of select="$eq2"/></td>
                        </xsl:otherwise>
                    </xsl:choose>
				</tr>
                </xsl:for-each>
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>