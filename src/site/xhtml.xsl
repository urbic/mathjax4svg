<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:d="http://docbook.org/ns/docbook"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xslthl="http://xslthl.sf.net"
	xmlns:lxslt="http://xml.apache.org/xslt"
	exclude-result-prefixes="xlink lxslt d xslthl #default"
	version="1.1"
	>
	<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml-1_1/profile-onechunk.xsl"/>
	<xsl:import href="highlight.xsl"/>

	<!-- <param name="base.dir">xhtml/</param> -->
	<xsl:param name="html.extra.head.links" select="1"/>
	<xsl:param name="header.rule" select="0"/>
	<xsl:param name="footer.rule" select="0"/>
	<xsl:param name="blurb.on.titlepage.enabled" select="1"/>
	<!--xsl:param name="l10n.gentext.default.language">ru</xsl:param-->
	<xsl:param name="callout.graphics" select="0"/>
	<xsl:param name="callout.unicode" select="1"/>
	<xsl:param name="admon.graphics" select="1"/>
	<xsl:param name="admon.graphics.path">admonitions/</xsl:param>
	<xsl:param name="admon.graphics.extension">.svg</xsl:param>
	<xsl:param name="admon.style"/>
	<xsl:param name="textinsert.extension" select="1"/>
	<xsl:param name="use.id.as.filename" select="1"/>
	<xsl:param name="use.svg" select="1"/>
	<xsl:param name="variablelist.term.break.after" select="1"/>
	<xsl:param name="index.on.type" select="1"/>
	<xsl:param name="use.extensions" select="1"/>
	<xsl:param name="make.graphic.viewport" select="1"/>
	<xsl:param name="highlight.source" select="1"/>
	<xsl:param name="variablelist.term.separator"/>
	<xsl:param name="css.decoration" select="0"/>
	<xsl:param name="graphicsize.extension" select="0"/>
	<xsl:param name="graphicsize.use.img.src.path" select="1"/>
	<xsl:param name="make.year.ranges" select="1"/>
	<xsl:param name="navig.graphics" select="1"/>
	<xsl:param name="navig.graphics.path">navigation/</xsl:param>
	<xsl:param name="navig.graphics.extension">.svg</xsl:param>
	<xsl:param name="shortcut.icon"/>
	<xsl:param name="keep.relative.image.uris" select="1"/>
	<xsl:param name="make.clean.html" select="1"/>
	<xsl:param name="docbook.css.source"/>
	<xsl:param name="table.borders.with.css" select="1"/>
	<xsl:param name="callout.unicode.font" select="'STIX General'"/>
	<xsl:param name="polyfill.url"/>
	<xsl:param name="mathjax.url"/>

	<xsl:output method="xml" omit-xml-declaration="yes"/>
	
	<xsl:template name="root.attributes">
		<xsl:attribute name="xml:lang">
			<xsl:value-of select="ancestor-or-self::d:*/@xml:lang"/>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="user.head.content">
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="license" href="LICENSE" type="text/plain"/>
		<script src="{$polyfill.url}" type="application/ecmascript"><xsl:comment/></script>
		<script async="async" src="{$mathjax.url}" type="application/ecmascript"><xsl:comment/></script>
	</xsl:template>

	<xsl:template name="is.graphic.format">
		<xsl:param name="format"/>
		<xsl:if test="$format='SVG'
				or $format='PNG'
				or $format='JPG'
				or $format='JPEG'
				or $format='linespecific'
				or $format='GIF'
				or $format='GIF87a'
				or $format='GIF89a'
				or $format='BMP'
				or $format='HTML'
				or $format='XHTML'">1</xsl:if>
	</xsl:template>

	<xsl:template match="d:imagedata[@format='XHTML']">
		<object
			type="application/xhtml+xml"
			data="{@fileref}"
			width="{@width}"
			height="{@height}"
			/>
	</xsl:template>

</xsl:stylesheet>
