package unit.xmlHelper {
import flexunit.framework.*;
import mindscriptact.utils.xml.*;
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.complex.*;

/**
 * COMMENT
 * @author
 */
public class XmlHelperTests {
	
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
		
		var obj:VarUintObj = XmlHelper.fillObjectWithXml(VarUintObj, xml) as VarUintObj;
		
		Assert.assertEquals("Main tag atribute uint type is not parsed to object.", obj.testUint, 123);
	
	}
	
	[Test]
	
	public function xmlHelper_uintVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testUint>123</testUint>
			</data>;
		
		var obj:VarUintObj = XmlHelper.fillObjectWithXml(VarUintObj, xml) as VarUintObj;
		
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
		
		var obj:VarIntObj = XmlHelper.fillObjectWithXml(VarIntObj, xml) as VarIntObj;
		
		Assert.assertEquals("Main tag atribute int type is not parsed to object.", obj.testInt, -123);
	
	}
	
	[Test]
	
	public function xmlHelper_intVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testInt>-123</testInt>
			</data>;
		
		var obj:VarIntObj = XmlHelper.fillObjectWithXml(VarIntObj, xml) as VarIntObj;
		
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
		var obj:VarNumberObj = XmlHelper.fillObjectWithXml(VarNumberObj, xml) as VarNumberObj;
		
		Assert.assertEquals("Main tag atribute string type is not parsed to object.", obj.testNumber, -12.3);
	
	}
	
	[Test]
	
	public function xmlHelper_stringVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testNumber>-12.3</testNumber>
			</data>;
		
		var obj:VarNumberObj = XmlHelper.fillObjectWithXml(VarNumberObj, xml) as VarNumberObj;
		
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
		
		var obj:VarBooleanObj = XmlHelper.fillObjectWithXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagLowerCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBoolean>true</testBoolean>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.fillObjectWithXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeUpperCase_ok():void {
		
		var xml:XML = 
			<data testBoolean='TRUE'>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.fillObjectWithXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagUpperCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBoolean>TRUE</testBoolean>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.fillObjectWithXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeNumber_ok():void {
		
		var xml:XML = 
			<data testBoolean='1'>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.fillObjectWithXml(VarBooleanObj, xml) as VarBooleanObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagNumber_ok():void {
		
		var xml:XML = 
			<data>
				<testBoolean>1</testBoolean>
			</data>;
		
		var obj:VarBooleanObj = XmlHelper.fillObjectWithXml(VarBooleanObj, xml) as VarBooleanObj;
		
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
		
		var obj:VarStringObj = XmlHelper.fillObjectWithXml(VarStringObj, xml) as VarStringObj;
		
		Assert.assertEquals("Main tag atribute number type is not parsed to object.", obj.testString, "aoeu123");
	
	}
	
	[Test]
	
	public function xmlHelper_numberVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testString>aoeu123</testString>
			</data>;
		
		var obj:VarStringObj = XmlHelper.fillObjectWithXml(VarStringObj, xml) as VarStringObj;
		
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
		
		var obj:VarDictionaryObj = XmlHelper.fillObjectWithXml(VarDictionaryObj, xml) as VarDictionaryObj;
		
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
		
		var obj:VarDictionaryObj = XmlHelper.fillObjectWithXml(VarDictionaryObj, xml) as VarDictionaryObj;
		
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
		
		var obj:VarDictionaryObj = XmlHelper.fillObjectWithXml(VarDictionaryObj, xml) as VarDictionaryObj;
	}
	
	//----------------------------------
	//     Vector
	//----------------------------------
	
	//*
	[Test]
	
	public function xmlHelper_vectorOfIntsVariableNotConstructed_fails():void {
		
		var xml:XML =
			<data>
				<varVectOfInts>
					<item>111</item>
					<item>222</item>
					<item>333</item>
				</varVectOfInts>
			</data>;
		
		var obj:VarVectorOfInts = XmlHelper.fillObjectWithXml(VarVectorOfInts, xml) as VarVectorOfInts;
		
		Assert.assertNotNull("Not initialized vector must be created.", obj.varVectOfInts);
	}
	
	[Test]
	
	public function xmlHelper_vectorOfObjectsVariablesInSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfTestData>
					<item id="1" str="test1" nr="11.11"/>
					<item id="2" str="test2" nr="22.22"/>
					<item id="3" str="test3" nr="33.33"/>
				</varVectOfTestData>
			</data>;
		
		var obj:VarVectorOfTestData = XmlHelper.fillObjectWithXml(VarVectorOfTestData, xml) as VarVectorOfTestData;
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to int properly.", obj.varVectOfTestData[0].id, 1);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to int properly.", obj.varVectOfTestData[1].id, 2);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to int properly.", obj.varVectOfTestData[2].id, 3);
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to String properly.", obj.varVectOfTestData[0].str, "test1");
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to String properly.", obj.varVectOfTestData[1].str, "test2");
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to String properly.", obj.varVectOfTestData[2].str, "test3");
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to Number properly.", obj.varVectOfTestData[0].nr, 11.11);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to Number properly.", obj.varVectOfTestData[1].nr, 22.22);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to Number properly.", obj.varVectOfTestData[2].nr, 33.33);
	
	}
	
	[Test]
	
	public function xmlHelper_vectorOfObjectsVariablesInSubSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfTestData>
					<item>
						<id>1</id>
						<str>test1</str>
						<nr>11.11</nr>
					</item>
					<item>
						<id>2</id>
						<str>test2</str>
						<nr>22.22</nr>
					</item>
					<item>
						<id>3</id>
						<str>test3</str>
						<nr>33.33</nr>
					</item>
				</varVectOfTestData>
			</data>;
		
		var obj:VarVectorOfTestData = XmlHelper.fillObjectWithXml(VarVectorOfTestData, xml) as VarVectorOfTestData;
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to int properly.", obj.varVectOfTestData[0].id, 1);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to int properly.", obj.varVectOfTestData[1].id, 2);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to int properly.", obj.varVectOfTestData[2].id, 3);
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to String properly.", obj.varVectOfTestData[0].str, "test1");
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to String properly.", obj.varVectOfTestData[1].str, "test2");
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to String properly.", obj.varVectOfTestData[2].str, "test3");
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to Number properly.", obj.varVectOfTestData[0].nr, 11.11);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to Number properly.", obj.varVectOfTestData[1].nr, 22.22);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to Number properly.", obj.varVectOfTestData[2].nr, 33.33);
	
	}

	//*/

	//[Test]
	//
	//public function xmlHelper_vectorOfIntsVariablesInSubTag_ok():void {
	//
	//var xml:XML = 
	//<data>
	//<varVectOfInts>
	//<item>111</item>
	//<item>222</item>
	//<item>333</item>
	//</varVectOfInts>
	//</data>;
	//
	//var obj:VarVectorOfInts = XmlHelper.fillObjectWithXml(VarVectorOfInts, xml) as VarVectorOfInts;
	//
	//Assert.assertEquals("Vector of ints tag subtag is not parsed to Vector object.", obj.varVectOfInts[0], 111);
	//Assert.assertEquals("Vector of ints tag subtag is not parsed to Vector object.", obj.varVectOfInts[1], 222);
	//Assert.assertEquals("Vector of ints tag subtag is not parsed to Vector object.", obj.varVectOfInts[2], 333);
	//}

}
}