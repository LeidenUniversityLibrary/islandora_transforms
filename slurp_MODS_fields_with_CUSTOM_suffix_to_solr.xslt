<?xml version="1.0" encoding="UTF-8"?>
<!-- Set of commonly used fields suffixed with "all" -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mods="http://www.loc.gov/mods/v3"
  xmlns:xlink="http://www.w3.org/1999/xlink"
     exclude-result-prefixes="mods">

     <!-- Combine the nonsort value and the title value of the first typeless titleInfo into a custom field -->
     <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]" mode="slurp_custom_suffix">
       <xsl:call-template name="mods_custom_suffix">
         <xsl:with-param name="field_name" select="'titleInfo_title_custom'"/>
         <xsl:with-param name="content" select="concat(mods:nonSort, mods:title)"/>
       </xsl:call-template>
     </xsl:template>

     <!-- Combine the nameparts and years into a custom field -->
     <xsl:template match="mods:mods/mods:name" mode="slurp_custom_suffix">
       <xsl:variable name="combinedName">
         <!-- Loop nameparts that are not of type date -->
         <xsl:for-each select="mods:namePart[not(@type = 'date')]">
           <!-- Output the value of the namepart -->
           <xsl:value-of select="current()"/>
           <!-- Add a separator if not the last namepart -->
           <xsl:if test="position() != last()">
             <xsl:text>, </xsl:text>
           </xsl:if>
         </xsl:for-each>

         <!-- Output nameparts of type date within parentheses) -->
         <xsl:variable name="dateNameParts" select="mods:namePart[@type = 'date']"/>
         <xsl:if test="count($dateNameParts) > 0">
           <xsl:text> (</xsl:text>
           <xsl:for-each select="$dateNameParts">
             <xsl:value-of select="current()"/>
             <!-- Add a separator if not the last namepart -->
             <xsl:if test="position() != last()">
               <xsl:text>, </xsl:text>
             </xsl:if>
           </xsl:for-each>
           <xsl:text>)</xsl:text>
         </xsl:if>
       </xsl:variable>
       <xsl:call-template name="mods_custom_suffix">
         <xsl:with-param name="field_name" select="'name_namePart_custom'"/>
         <xsl:with-param name="content" select="$combinedName"/>
       </xsl:call-template>
     </xsl:template>

     <!-- Writes a Solr field. -->
     <xsl:template name="mods_custom_suffix">
       <xsl:param name="field_name"/>
       <xsl:param name="content"/>
       <xsl:if test="not(normalize-space($content) = '')">
         <field>
           <xsl:attribute name="name">
             <xsl:value-of select="concat('mods_', $field_name, '_ms')"/>
           </xsl:attribute>
           <xsl:value-of select="$content"/>
         </field>
       </xsl:if>
     </xsl:template>
</xsl:stylesheet>
