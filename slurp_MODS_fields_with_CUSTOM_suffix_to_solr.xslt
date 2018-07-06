<?xml version="1.0" encoding="UTF-8"?>
<!-- Set of commonly used fields suffixed with "all" -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mods="http://www.loc.gov/mods/v3"
  xmlns:xlink="http://www.w3.org/1999/xlink"
     exclude-result-prefixes="mods">

     <!--
        Combine the nonsort value and the title value of the first typeless titleInfo into a custom field
      -->
     <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]" mode="slurp_titleInfo_title_custom">
       <xsl:call-template name="mods_custom_suffix">
         <xsl:with-param name="field_name" select="'titleInfo_title_custom'"/>
         <xsl:with-param name="content" select="concat(mods:nonSort, mods:title)"/>
       </xsl:call-template>
     </xsl:template>

     <!--
        Create a sorting title into a custom field
      -->
     <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]" mode="slurp_titleInfo_sortingTitle_custom">
       <xsl:variable name="sortingTitle">
         <xsl:call-template name="padNumbers">
           <xsl:with-param name="string" select="mods:title"/>
           <xsl:with-param name="numberFormat" select="'00000'"/>
         </xsl:call-template>
       </xsl:variable>
       <xsl:call-template name="mods_custom_suffix">
         <xsl:with-param name="field_name" select="'titleInfo_sortingTitle_custom'"/>
         <xsl:with-param name="content" select="normalize-space($sortingTitle)"/>
       </xsl:call-template>
     </xsl:template>

     <!--
        Combine the nameparts and years into a custom field
      -->
     <xsl:template match="mods:mods/mods:name" mode="slurp_name_namePart_custom">
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

     <!--
        Writes a Solr field.
      -->
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

     <!--
        Pad all numbers in a string
        example 1: ABCD 12  -> ABCD 00012
        example 2: A1B2     -> A00001B00002
     -->
     <xsl:template name="padNumbers">
        <xsl:param name="string" select="''"/>
        <xsl:param name="numberFormat" select="'00000'"/>

        <xsl:param name="numberStack" select="''"/>

        <xsl:if test="string-length($string) > 0">
            <xsl:variable name="currentChar" select="substring($string,1,1)"/>
            <xsl:variable name="currentCharIsNumeric" select="string-length(translate($currentChar, '1234567890', '')) = 0"/>

            <xsl:variable name="nextChar" select="substring($string,2,1)"/>
            <xsl:variable name="nextCharIsnumeric" select="string-length($nextChar) > 0 and string-length(translate($nextChar, '1234567890', '')) = 0"/>

            <xsl:if test="not($currentCharIsNumeric)">
                <xsl:value-of select="$currentChar"/>
            </xsl:if>

            <xsl:if test="$currentCharIsNumeric and not($nextCharIsnumeric)">
                <!-- next char is not numeric, collect what we have so far -->
                <xsl:value-of select="format-number(concat($numberStack, $currentChar), $numberFormat)"/>
            </xsl:if>


            <!-- add current char to the numberstack if it is a number and the next one is also a number -->
            <xsl:variable name="newNumberStack">
                <xsl:if test="$currentCharIsNumeric and $nextCharIsnumeric">
                    <xsl:value-of select="concat($numberStack, $currentChar)"/>
                </xsl:if>
            </xsl:variable>

            <!-- recurse into next if there are more characters to process -->
            <xsl:if test="string-length($string) > 1">
                <xsl:call-template name="padNumbers">
                    <xsl:with-param name="string" select="substring($string,2)"/>
                    <xsl:with-param name="numberStack" select="$newNumberStack"/>
                    <xsl:with-param name="numberFormat" select="$numberFormat"/>
                </xsl:call-template>
            </xsl:if>

        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
