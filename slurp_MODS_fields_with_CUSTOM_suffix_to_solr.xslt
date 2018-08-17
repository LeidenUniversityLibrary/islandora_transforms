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
       <xsl:variable name="titleLength" select="string-length(mods:title)"/>
       <xsl:variable name="sortingTitle">
         <xsl:choose>
           <xsl:when test="$titleLength &lt;= 40">
             <!-- Output all (so up to 40) characters with padded numbers -->
             <xsl:call-template name="padNumbers">
               <xsl:with-param name="string" select="mods:title"/>
             </xsl:call-template>
           </xsl:when>
           <xsl:otherwise>
             <!-- Output first 20 characters with padded numbers -->
             <xsl:call-template name="padNumbers">
               <xsl:with-param name="string" select="substring(mods:title, 1, 20)"/>
             </xsl:call-template>
             
             <!-- Output characters between the first 20 and the last 20 characters -->
             <xsl:if test="$titleLength > 40">
               <xsl:value-of select="substring(mods:title, 21, $titleLength - 40)"/>
             </xsl:if>
             
             <!-- Output last (up to) 20 characters with padded numbers -->
             <xsl:if test="$titleLength > 20">
               <xsl:variable name="lastTwentyIndex">
                 <xsl:choose>
                   <xsl:when test="$titleLength > 40"><xsl:value-of select="$titleLength - 19"/></xsl:when>
                   <xsl:otherwise>21</xsl:otherwise>
                 </xsl:choose>
               </xsl:variable>
               <xsl:call-template name="padNumbers">
                 <xsl:with-param name="string" select="substring(mods:title, $lastTwentyIndex, 20)"/>
               </xsl:call-template>
             </xsl:if>
           </xsl:otherwise>
         </xsl:choose>
       </xsl:variable>
       
       <xsl:call-template name="mods_custom_suffix">
         <xsl:with-param name="field_name" select="'titleInfo_sortingTitle_custom'"/>
         <xsl:with-param name="content" select="normalize-space($sortingTitle)"/>
       </xsl:call-template>
     </xsl:template>

     <!--
        Combine the nameparts, years and roles into several custom fields
      -->
     <xsl:template match="mods:mods/mods:name" mode="slurp_name_namePart_custom">
       
       <!-- Nameparts that hold names (no type) separated by commas -->
       <xsl:variable name="typelessNamePartsString">
         <xsl:variable name="typelessNameParts"/>
         <xsl:if test="count($typelessNameParts) > 0">
          <!-- Loop nameparts that are not of type date -->
          <xsl:for-each select="mods:namePart[not(@type = 'date')]">
            <!-- Output the value of the namepart -->
            <xsl:value-of select="current()"/>
            <!-- Add a separator if not the last namepart -->
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
         </xsl:if>
       </xsl:variable>
       
       <!-- Nameparts that hold dates separated by commas -->
       <xsl:variable name="dateNamePartsString">
         <!-- Output nameparts of type date within parentheses) -->
         <xsl:variable name="dateNameParts" select="mods:namePart[@type = 'date']"/>
         <xsl:if test="count($dateNameParts) > 0">
           <xsl:for-each select="$dateNameParts">
             <xsl:value-of select="current()"/>
             <!-- Add a separator if not the last namepart -->
             <xsl:if test="position() != last()">
               <xsl:text>, </xsl:text>
             </xsl:if>
           </xsl:for-each>
         </xsl:if>
       </xsl:variable>
       
       <xsl:if test="string-length(normalize-space($typelessNamePartsString))">
         
         <!-- Write name_namePart_custom -->
         <xsl:call-template name="mods_custom_suffix">
           <xsl:with-param name="field_name" select="'name_namePart_custom'"/>
           <xsl:with-param name="content" select="concat($typelessNamePartsString, ' (', $dateNamePartsString,')')"/>
         </xsl:call-template>
       </xsl:if>
       
       <!-- Write name_type_namePart_custom -->
       <xsl:call-template name="mods_custom_suffix">
         <xsl:with-param name="field_name" select="concat('name_',@type,'namePart_custom')"/>
         <xsl:with-param name="content" select="concat($typelessNamePartsString, ' (', $dateNamePartsString,')')"/>
       </xsl:call-template>
       
       <xsl:for-each select="mods:role[@authority = 'marcrelator']">
         <!-- Write name_type_namePart_role_custom -->
         <xsl:variable name="roleString">
           <xsl:choose>
             <xsl:when test="mods:roleTerm/@type = 'code'">
               <xsl:call-template name="get_english_marcrole">
                 <xsl:with-param name="code" select="mods:roleTerm/@type"/>
               </xsl:call-template>
             </xsl:when>
             <xsl:otherwise>
               <xsl:value-of select="mods:roleTerm"/>
             </xsl:otherwise>
           </xsl:choose>
         </xsl:variable>
         <xsl:call-template name="mods_custom_suffix">
           <xsl:with-param name="field_name" select="concat('name_',@type,'namePart_custom')"/>
           <xsl:with-param name="content" select="concat($roleString,': ',$typelessNamePartsString, ' (', $dateNamePartsString,')')"/>
         </xsl:call-template>
         
       </xsl:for-each>
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
       Note: longer strings might cause a stack overflow.
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
                <!-- current char is not numeric so we output it as is -->
                <xsl:value-of select="$currentChar"/>
            </xsl:if>

            <xsl:if test="$currentCharIsNumeric and not($nextCharIsnumeric)">
              <!-- next char is not numeric, so pad, then output the numberstack -->
              <xsl:value-of select="concat(substring($numberFormat, 1, string-length($numberFormat) - string-length($numberStack)-1), $numberStack, $currentChar)"/>
            </xsl:if>


            <xsl:variable name="newNumberStack">
                <xsl:if test="$currentCharIsNumeric and $nextCharIsnumeric">
                    <!-- expecting more numbers so add current number to stack -->
                    <xsl:value-of select="concat($numberStack, $currentChar)"/>
                </xsl:if>
            </xsl:variable>

            <!-- recurse into next if there are more characters to process -->
            <xsl:if test="string-length($string) > 1">
                <xsl:variable name="remaining" select="substring($string,2)"/>
                <xsl:variable name="remainingHasNumeric" select="string-length($remaining) > string-length(translate($remaining, '1234567890', ''))"/>
                <xsl:choose>
                    <xsl:when test="$remainingHasNumeric or string-length($newNumberStack) > 0">
                        <xsl:call-template name="padNumbers">
                            <xsl:with-param name="string" select="$remaining"/>
                            <xsl:with-param name="numberStack" select="$newNumberStack"/>
                            <xsl:with-param name="numberFormat" select="$numberFormat"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$remaining"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>

        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
