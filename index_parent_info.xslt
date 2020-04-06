<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:string="xalan://java.lang.String"
  xmlns:encoder="xalan://java.net.URLEncoder"
  xmlns:mods="http://www.loc.gov/mods/v3">

  <!-- Templates for indexing pinpointed info from parents. These have many-to-
       one and/or many-to-many relationships with documents, so ignoring the
       standard MODS indexing to ensure only multivalued fields are used. -->

   <xsl:template name="displayLabel_writer">
     <xsl:param name="content"/>
     <xsl:param name="prefix"/>
     <xsl:param name="suffix">_ms</xsl:param>
     <!-- Display Label. -->
     <xsl:for-each select="$content/mods:accessCondition/@displayLabel">
       <field>
         <xsl:attribute name="name">
           <xsl:value-of select="concat($prefix, 'mods_accessCondition_displayLabel', $suffix)"/>
         </xsl:attribute>
         <xsl:value-of select="."/>
       </field>
     </xsl:for-each>
   </xsl:template>

  <xsl:template name="type_writer">
    <xsl:param name="content"/>
    <xsl:param name="prefix"/>
    <xsl:param name="suffix">_ms</xsl:param>
    <!-- AccessCondition: type. -->
    <xsl:for-each select="$content/mods:accessCondition/@type">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'mods_accessCondition_type', $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </field>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="dateOther_writer">
    <xsl:param name="content"/>
    <xsl:param name="prefix"/>
    <xsl:param name="suffix">_mdt</xsl:param>
    <!-- OriginInfo: dateOther. -->
    <xsl:for-each select="$content/mods:originInfo/mods:dateOther[@encoding='w3cdtf' and @type='embargo']">
      <xsl:variable name="dateValue">
        <xsl:call-template name="get_ISO8601_date">
          <xsl:with-param name="date" select="current()" />
          <xsl:with-param name="pid" select="$PID" />
          <xsl:with-param name="datastream" select="MODS" />
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="not(normalize-space($dateValue)='')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'mods_originInfo_encoding_w3cdtf_type_embargo_dateOther', $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="$dateValue"/>
        </field>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="fulltext_writer">
    <xsl:param name="content"/>
    <xsl:param name="prefix"/>
    <xsl:param name="field">FULL_TEXT</xsl:param>
    <xsl:param name="suffix">_mt</xsl:param>
    <!-- full_text. -->
    <field>
      <xsl:attribute name="name">
        <xsl:value-of select="concat($prefix, $field, $suffix)"/>
      </xsl:attribute>
      <xsl:value-of select="$content"/>
    </field>
  </xsl:template>

</xsl:stylesheet>

