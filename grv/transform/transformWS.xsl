<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="WebServiceSampler ">
	<xsl:element name="SoapSampler">
		<xsl:attribute name="guiclass">SoapSamplerGui</xsl:attribute>
		<xsl:attribute name="testclass">SoapSampler</xsl:attribute>
		<xsl:choose>
			<xsl:when test="@testname ='WebService(SOAP) Request (DEPRECATED)' ">
				<xsl:attribute name="testname">SOAP/XML-RPC Request</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="testname"><xsl:value-of select="@testname"/></xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:attribute name="enabled"><xsl:value-of select="@enabled"/></xsl:attribute>
		<elementProp name="HTTPsampler.Arguments" elementType="Arguments">
			<collectionProp name="Arguments.arguments"/>
		</elementProp>
		<stringProp name="TestPlan.comments"><xsl:value-of select="stringProp[@name='TestPlan.comments']/text()" /></stringProp>
		<stringProp name="SoapSampler.URL_DATA"><xsl:value-of select="stringProp[@name='HTTPSampler.protocol']/text()" />://<xsl:value-of select="stringProp[@name='HTTPSampler.domain']/text()" />:<xsl:value-of select="stringProp[@name='HTTPSampler.port']/text()" /><xsl:value-of select="stringProp[@name='HTTPSampler.path']/text()" /></stringProp>
		<stringProp name="HTTPSamper.xml_data"><xsl:value-of select="stringProp[@name='HTTPSamper.xml_data']/text()" /></stringProp>
		<stringProp name="SoapSampler.xml_data_file"><xsl:value-of select="stringProp[@name='WebServiceSampler.xml_data_file']/text()" /></stringProp>
		<stringProp name="SoapSampler.SOAP_ACTION"><xsl:value-of select="stringProp[@name='Soap.Action']/text()" /></stringProp>
		<stringProp name="SoapSampler.SEND_SOAP_ACTION"><xsl:value-of select="(stringProp[@name='Soap.Action']/text() != '')" /></stringProp>			
		<boolProp name="HTTPSampler.use_keepalive">false</boolProp>		
	</xsl:element>
  </xsl:template>
</xsl:stylesheet>