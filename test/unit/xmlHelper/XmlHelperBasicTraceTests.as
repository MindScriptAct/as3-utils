package unit.xmlHelper {
import flexunit.framework.*;
import mindscriptact.utils.xml.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.complex.*;
import unit.xmlHelper.testObj.dataTrace.*;

/**
 * COMMENT
 * @author
 */
public class XmlHelperBasicTraceTests {
	
	[Before]
	
	public function runBeforeEveryTest():void {
	}
	
	[After]
	
	public function runAfterEveryTest():void {
	}
	
	//----------------------------------
	//     uint
	//----------------------------------
	
	//*
	
	[Test]
	
	public function xmlHelper_traceObjeFromeXmlMainObjectVars_ok():void {
		
		var xml:XML =
			<data testInt='123' testNumber='-12.3'  testBoolean='true' testString='aoeu123'>
				<testInt2>123</testInt2>
				<testNumber2>-12.3</testNumber2>
				<testBoolean2>true</testBoolean2>
				<testString2>aoeu123</testString2>
				
				<testCompex1 tentInt3="333" testNumber3="33.3"></testCompex1>
				
				<testCompex2>
					<tentInt4>444</tentInt4>
				</testCompex2>
			
			</data>;
		
		var obj:String = XmlHelper.traceObjFromXml(VarBlankObj, xml);
	
	}
	
	[Test]
	
	public function xmlHelper_traceObjeFromeXmlSubObjectVars_ok():void {
		
		var xml:XML =
			<data test="data">
				
				<test1 testInt='123' testNumber='-12.3'  testBoolean='true' testString='aoeu123'/>
				
				<test2>
					<testInt2>123</testInt2>
					<testNumber2>-12.3</testNumber2>
					<testBoolean2>true</testBoolean2>
					<testString2>aoeu123</testString2>
				</test2>
				
				<test3>
					<testCompex1 tentInt3="333" testNumber3="33.3"></testCompex1>
					
					<testCompex2>
						<tentInt4>444</tentInt4>
					</testCompex2>
				</test3>
			
			</data>;
		
		var obj:String = XmlHelper.traceObjFromXml(VarSubObjectTraceTest, xml);
	
	}
	
	//*/
	
	//----------------------------------
	//     oject to xml
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectBlank_ok():void {
		
		var xmlIn:XML = 
			<data noise='abc123'>
				<trash>trashData</trash>
			</data>;
		
		var xmlResult:XML = 
			<data noise='abc123'>
				<trash>trashData</trash>
			</data>;
		
		var data:VarBlankDataObj = new VarBlankDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Blank should not change output.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     int
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectIntVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testInt>123</testInt>
			</data>;
		
		var data:VarIntDataObj = new VarIntDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Int is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectIntVarWithMainPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data testInt=''>
			</data>;
		
		var xmlResult:XML = 
			<data testInt='123'>
			</data>;
		
		var data:VarIntDataObj = new VarIntDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Int is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectIntVarWithSubChildPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testInt></testInt>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testInt>123</testInt>
			</data>;
		
		var data:VarIntDataObj = new VarIntDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Int is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Uint
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectUintVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testUint>1234</testUint>
			</data>;
		
		var data:VarUintDataObj = new VarUintDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Uint is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectUintVarWithMainPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data testUint=''>
			</data>;
		
		var xmlResult:XML = 
			<data testUint='1234'>
			</data>;
		
		var data:VarUintDataObj = new VarUintDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Uint is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectUintVarWithSubChildPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testUint></testUint>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testUint>1234</testUint>
			</data>;
		
		var data:VarUintDataObj = new VarUintDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Uint is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Number
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectNumberVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testNumber>-12.34</testNumber>
			</data>;
		
		var data:VarNumberDataObj = new VarNumberDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Number is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectNumberVarWithMainPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data testNumber=''>
			</data>;
		
		var xmlResult:XML = 
			<data testNumber='-12.34'>
			</data>;
		
		var data:VarNumberDataObj = new VarNumberDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Number is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectNumberVarWithSubChildPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testNumber></testNumber>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testNumber>-12.34</testNumber>
			</data>;
		
		var data:VarNumberDataObj = new VarNumberDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Number is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Boolean
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectBooleanVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testBoolean>true</testBoolean>
			</data>;
		
		var data:VarBooleanDataObj = new VarBooleanDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Boolean is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectBooleanVarWithMainPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data testBoolean=''>
			</data>;
		
		var xmlResult:XML = 
			<data testBoolean='true'>
			</data>;
		
		var data:VarBooleanDataObj = new VarBooleanDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Boolean is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectBooleanVarWithSubChildPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testBoolean></testBoolean>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testBoolean>true</testBoolean>
			</data>;
		
		var data:VarBooleanDataObj = new VarBooleanDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Boolean is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     String
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectStringVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testString>abc123</testString>
			</data>;
		
		var data:VarStringDataObj = new VarStringDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. String is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectStringVarWithMainPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data testString=''>
			</data>;
		
		var xmlResult:XML = 
			<data testString='abc123'>
			</data>;
		
		var data:VarStringDataObj = new VarStringDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. String is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectStringVarWithSubChildPlaceholder_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testString></testString>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testString>abc123</testString>
			</data>;
		
		var data:VarStringDataObj = new VarStringDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. String is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Dictionary
	//----------------------------------
	
	[Test(expects="Error")]
	
	public function xmlHelper_traceXmlFromObjectDictionaryDublicatedVar_fails():void {
		
		var xmlIn:XML = 
			<data>
				<testDictionary>
				</testDictionary>
				<testDictionary>
				</testDictionary>				
			</data>;
		
		var data:VarDictionaryDataObj = new VarDictionaryDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectDictionaryVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testDictionary>
					<test>abc123</test>
				</testDictionary>
			</data>;
		
		var data:VarDictionaryDataObj = new VarDictionaryDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Dictionary is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectDictionarySingeVar_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testDictionary>
				</testDictionary>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testDictionary>
					<test>abc123</test>
				</testDictionary>
			</data>;
		
		var data:VarDictionaryDataObj = new VarDictionaryDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Dictionary is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectDictionarySingeVarWithSubnodes_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testDictionary>
					<test></test>
				</testDictionary>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testDictionary>
					<test>abc123</test>
				</testDictionary>
			</data>;
		
		var data:VarDictionaryDataObj = new VarDictionaryDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Dictionary is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectDictionarySingeVarWithAttributes_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testDictionary test=""/>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testDictionary test="abc123"/>
			</data>;
		
		var data:VarDictionaryDataObj = new VarDictionaryDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Dictionary is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Object
	//----------------------------------
	
	[Test(expects="Error")]
	
	public function xmlHelper_traceXmlFromObjectObjectDublicatedVar_fails():void {
		
		var xmlIn:XML = 
			<data>
				<testObject>
				</testObject>
				<testObject>
				</testObject>				
			</data>;
		
		var data:VarObjectDataObj = new VarObjectDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectObjectVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testObject>
					<test>abc123</test>
				</testObject>
			</data>;
		
		var data:VarObjectDataObj = new VarObjectDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Object is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectObjectSingeVar_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testObject>
				</testObject>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testObject>
					<test>abc123</test>
				</testObject>
			</data>;
		
		var data:VarObjectDataObj = new VarObjectDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Object is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectObjectSingeVarWithSubnodes_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testObject>
					<test></test>
				</testObject>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testObject>
					<test>abc123</test>
				</testObject>
			</data>;
		
		var data:VarObjectDataObj = new VarObjectDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Object is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectObjectSingeVarWithAttributes_ok():void {
		
		var xmlIn:XML = 
			<data>
				<testObject test=""/>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<testObject test="abc123"/>
			</data>;
		
		var data:VarObjectDataObj = new VarObjectDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracink xml failed. Object is not traced corectly.", xmlResult, xmlOut);
	
	}

}
}