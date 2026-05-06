<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Список</title>
        <style>
          strong { color: #000000; }
        </style>
      </head>
      <body>
        <h2>Обмен сообщениями</h2>
        <ul>
          <xsl:apply-templates select="items/item[@parentid='0']"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="item">
    <li>
      <strong><xsl:value-of select="@author"/></strong>
      <xsl:text> пишет: </xsl:text>
      <xsl:value-of select="."/>
      <xsl:variable name="myId" select="@id"/>
      <xsl:if test="/items/item[@parentid=$myId]">
        <ul>
          <xsl:apply-templates select="/items/item[@parentid=$myId]"/>
        </ul>
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>
