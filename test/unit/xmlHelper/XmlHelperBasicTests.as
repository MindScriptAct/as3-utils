package unit.xmlHelper {
import flexunit.framework.*;
import mindscriptact.utils.xml.*;
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.complex.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author
 */
public class XmlHelperBasicTests {
	
	[Before]
	
	public function runBeforeEveryTest():void {
	}
	
	[After]
	
	public function runAfterEveryTest():void {
	}
	
	//----------------------------------
	//     uint
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_uintVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data testUint='123'>
			</data>;
		
		var obj:VarUintObj = XmlHelper.parseXml(VarUintObj, xml) as VarUintObj;
		
		Assert.assertEquals("Main tag atribute uint type is not parsed to object.", obj.testUint, 123);
	
	}
	
	[Test]
	
	public function xmlHelper_uintVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testUint>123</testUint>
			</data>;
		
		var obj:VarUintObj = XmlHelper.parseXml(VarUintObj, xml) as VarUintObj;
		
		Assert.assertEquals("Sub tag uint type is not parsed to object.", obj.testUint, 123);
	
	}
	
	//----------------------------------
	//     int
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_intVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data testInt='-123'>
			</data>;
		
		var obj:VarIntObj = XmlHelper.parseXml(VarIntObj, xml) as VarIntObj;
		
		Assert.assertEquals("Main tag atribute int type is not parsed to object.", obj.testInt, -123);
	
	}
	
	[Test]
	
	public function xmlHelper_intVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testInt>-123</testInt>
			</data>;
		
		var obj:VarIntObj = XmlHelper.parseXml(VarIntObj, xml) as VarIntObj;
		
		Assert.assertEquals("Sub tag int type is not parsed to object.", obj.testInt, -123);
	
	}
	
	//----------------------------------
	//     Number
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_stringVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data testNumber='-12.3'>
			</data>;
		//
		var obj:VarNumberObj = XmlHelper.parseXml(VarNumberObj, xml) as VarNumberObj;
		
		Assert.assertEquals("Main tag atribute string type is not parsed to object.", obj.testNumber, -12.3);
	
	}
	
	[Test]
	
	public function xmlHelper_stringVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testNumber>-12.3</testNumber>
			</data>;
		
		var obj:VarNumberObj = XmlHelper.parseXml(VarNumberObj, xml) as VarNumberObj;
		
		Assert.assertEquals("Sub tag string type is not parsed to object.", obj.testNumber, -12.3);
	
	}
	
	//----------------------------------
	//     Boolean
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeLowerCase_ok():void {
		
		var xml:XML = 
			<data testBoolean='true'>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.parseXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagLowerCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBoolean>true</testBoolean>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.parseXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeUpperCase_ok():void {
		
		var xml:XML = 
			<data testBoolean='TRUE'>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.parseXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagUpperCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBoolean>TRUE</testBoolean>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.parseXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeNumber_ok():void {
		
		var xml:XML = 
			<data testBoolean='1'>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.parseXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagNumber_ok():void {
		
		var xml:XML = 
			<data>
				<testBoolean>1</testBoolean>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.parseXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	//----------------------------------
	//     String
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_numberVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data testString='aoeu123'>
			</data>;
		
		var obj:VarStringObj = XmlHelper.parseXml(VarStringObj, xml) as VarStringObj;
		
		Assert.assertEquals("Main tag atribute number type is not parsed to object.", obj.testString, "aoeu123");
	
	}
	
	[Test]
	
	public function xmlHelper_numberVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testString>aoeu123</testString>
			</data>;
		
		var obj:VarStringObj = XmlHelper.parseXml(VarStringObj, xml) as VarStringObj;
		
		Assert.assertEquals("Sub tag number type is not parsed to object.", obj.testString, "aoeu123");
	
	}
	//----------------------------------
	//     dictionary
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_dictionaryVariableInMainTagAtribute_ok():void {
		
		var xml:XML =  
			<data>
				<testDictionary data1='testData1'/>
			</data>;
		
		var obj:VarDictionaryObj = XmlHelper.parseXml(VarDictionaryObj, xml) as VarDictionaryObj;
		
		Assert.assertEquals("Dictionary tag atribute is not parsed to Dictionary object.", obj.testDictionary['data1'], 'testData1');
	
	}
	
	[Test]
	
	public function xmlHelper_dictionaryVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testDictionary>
					<data1>testData1</data1>
				</testDictionary>
			</data>;
		
		var obj:VarDictionaryObj = XmlHelper.parseXml(VarDictionaryObj, xml) as VarDictionaryObj;
		
		Assert.assertEquals("Dictionary tag subtag is not parsed to Dictionary object.", obj.testDictionary['data1'], 'testData1');
	
	}
	
	[Test(expects="Error")]
	
	public function xmlHelper_dictionaryTagUsedMoreThenOnce_fails():void {
		
		var xml:XML =
			<data>
				<testDictionary>
				</testDictionary>
				<testDictionary>
				</testDictionary>
			</data>;
		
		var obj:VarDictionaryObj = XmlHelper.parseXml(VarDictionaryObj, xml) as VarDictionaryObj;
	}
	
	//----------------------------------
	//     Object
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_objectVariableInMainTagAtribute_ok():void {
		
		var xml:XML =  
			<data>
				<testObject data1='testData1'/>
			</data>;
		
		var obj:VarObjectObj = XmlHelper.parseXml(VarObjectObj, xml) as VarObjectObj;
		
		Assert.assertEquals("Object tag atribute is not parsed to Object object.", obj.testObject['data1'], 'testData1');
	
	}
	
	[Test]
	
	public function xmlHelper_objectVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testObject>
					<data1>testData1</data1>
				</testObject>
			</data>;
		
		var obj:VarObjectObj = XmlHelper.parseXml(VarObjectObj, xml) as VarObjectObj;
		
		Assert.assertEquals("Object tag subtag is not parsed to Object object.", obj.testObject['data1'], 'testData1');
	
	}
	
	[Test(expects="Error")]
	
	public function xmlHelper_objectTagUsedMoreThenOnce_fails():void {
		
		var xml:XML =
			<data>
				<testObject>
				</testObject>
				<testObject>
				</testObject>
			</data>;
		
		var obj:VarObjectObj = XmlHelper.parseXml(VarObjectObj, xml) as VarObjectObj;
	}

}
}