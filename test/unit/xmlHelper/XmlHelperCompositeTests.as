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
public class XmlHelperCompositeTests {
	
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
			<data>
				<testUintMain testUint='123'/>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute uint type is not parsed to object.", obj.testUintMain.testUint, 123);
	
	}
	
	[Test]
	
	public function xmlHelper_uintVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testUintMain>
					<testUint>123</testUint>
				</testUintMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag uint type is not parsed to object.", obj.testUintMain.testUint, 123);
	
	}
	
	//----------------------------------
	//     int
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_intVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data>
				<testIntMain testInt='-123'/>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute int type is not parsed to object.", obj.testIntMain.testInt, -123);
	
	}
	
	[Test]
	
	public function xmlHelper_intVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testIntMain>
					<testInt>-123</testInt>
				</testIntMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag int type is not parsed to object.", obj.testIntMain.testInt, -123);
	
	}
	
	//----------------------------------
	//     Number
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_stringVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data>
				<testNumberMain testNumber='-12.3'/>
			</data>;
		//
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute string type is not parsed to object.", obj.testNumberMain.testNumber, -12.3);
	
	}
	
	[Test]
	
	public function xmlHelper_stringVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testNumberMain>
					<testNumber>-12.3</testNumber>
				</testNumberMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag string type is not parsed to object.", obj.testNumberMain.testNumber, -12.3);
	
	}
	
	//----------------------------------
	//     Boolean
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeLowerCase_ok():void {
		
		var xml:XML = 
			<data testBoolean='true'>
				<testBooleanMain testBoolean='true'/>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBooleanMain.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagLowerCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBooleanMain>
					<testBoolean>true</testBoolean>
				</testBooleanMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBooleanMain.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeUpperCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBooleanMain testBoolean='TRUE'/>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBooleanMain.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagUpperCase_ok():void {
		
		var xml:XML = 
			<data>
				<testBooleanMain>
					<testBoolean>TRUE</testBoolean>
				</testBooleanMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBooleanMain.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInMainTagAtributeNumber_ok():void {
		
		var xml:XML = 
			<data>
				<testBooleanMain testBoolean='1'/>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute boolean type is not parsed to object.", obj.testBooleanMain.testBoolean, true);
	
	}
	
	[Test]
	
	public function xmlHelper_booleanVariableInSubTagNumber_ok():void {
		
		var xml:XML = 
			<data>
				<testBooleanMain>
					<testBoolean>1</testBoolean>
				</testBooleanMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag boolean type is not parsed to object.", obj.testBooleanMain.testBoolean, true);
	
	}
	
	//----------------------------------
	//     String
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_numberVariableInMainTagAtribute_ok():void {
		
		var xml:XML = 
			<data>
				<testStringMain testString='aoeu123'/>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Main tag atribute number type is not parsed to object.", obj.testStringMain.testString, "aoeu123");
	
	}
	
	[Test]
	
	public function xmlHelper_numberVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testStringMain>
					<testString>aoeu123</testString>
				</testStringMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Sub tag number type is not parsed to object.", obj.testStringMain.testString, "aoeu123");
	
	}
	//----------------------------------
	//     dictionary
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_dictionaryVariableInMainTagAtribute_ok():void {
		
		var xml:XML =  
			<data>
				<testDictionaryMain>
					<testDictionary data1='testData1'/>
				</testDictionaryMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Dictionary tag atribute is not parsed to Dictionary object.", obj.testDictionaryMain.testDictionary['data1'], 'testData1');
	
	}
	
	[Test]
	
	public function xmlHelper_dictionaryVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testDictionaryMain>
					<testDictionary>
						<data1>testData1</data1>
					</testDictionary>
				</testDictionaryMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Dictionary tag subtag is not parsed to Dictionary object.", obj.testDictionaryMain.testDictionary['data1'], 'testData1');
	
	}
	
	[Test(expects="Error")]
	
	public function xmlHelper_dictionaryTagUsedMoreThenOnce_fails():void {
		
		var xml:XML =
			<data>
				<testDictionaryMain>
					<testDictionary>
					</testDictionary>
					<testDictionary>
					</testDictionary>
				</testDictionaryMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
	}
	
	//----------------------------------
	//     Object
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_objectVariableInMainTagAtribute_ok():void {
		
		var xml:XML =  
			<data>
				<testObjectMain>
					<testObject data1='testData1'/>
				</testObjectMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Object tag atribute is not parsed to Object object.", obj.testObjectMain.testObject['data1'], 'testData1');
	
	}
	
	[Test]
	
	public function xmlHelper_objectVariableInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<testObjectMain>
					<testObject>
						<data1>testData1</data1>
					</testObject>
				</testObjectMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Object tag subtag is not parsed to Object object.", obj.testObjectMain.testObject['data1'], 'testData1');
	
	}
	
	[Test(expects="Error")]
	
	public function xmlHelper_objectTagUsedMoreThenOnce_fails():void {
		
		var xml:XML =
			<data>
				<testObjectMain>
					<testObject>
					</testObject>
					<testObject>
					</testObject>
				</testObjectMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
	}
	
	[Test]
	
	public function xmlHelper_vectorOfCustomObjectsVariablesInSubTag_ok():void {
		
		var xml:XML =
			<data>
				<testVectOfTestDataMain>
					<varVectOfTestData>
						<item id="1" str="test1" nr="11.11"/>
						<item id="2" str="test2" nr="22.22"/>
						<item id="3" str="test3" nr="33.33"/>
					</varVectOfTestData>
				</testVectOfTestDataMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to int properly.", obj.testVectOfTestDataMain.varVectOfTestData[0].id, 1);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to int properly.", obj.testVectOfTestDataMain.varVectOfTestData[1].id, 2);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to int properly.", obj.testVectOfTestDataMain.varVectOfTestData[2].id, 3);
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to String properly.", obj.testVectOfTestDataMain.varVectOfTestData[0].str, "test1");
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to String properly.", obj.testVectOfTestDataMain.varVectOfTestData[1].str, "test2");
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to String properly.", obj.testVectOfTestDataMain.varVectOfTestData[2].str, "test3");
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to Number properly.", obj.testVectOfTestDataMain.varVectOfTestData[0].nr, 11.11);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to Number properly.", obj.testVectOfTestDataMain.varVectOfTestData[1].nr, 22.22);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to Number properly.", obj.testVectOfTestDataMain.varVectOfTestData[2].nr, 33.33);
	
	}
	
	[Test]
	
	public function xmlHelper_vectorOfCustomObjectsVariablesInSubSubTag_ok():void {
		
		var xml:XML =
			<data>
				<testVectOfTestDataMain>
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
				</testVectOfTestDataMain>
			</data>;
		
		var obj:VarCompositeObj = XmlHelper.parseXml(VarCompositeObj, xml) as VarCompositeObj;
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to int properly.", obj.testVectOfTestDataMain.varVectOfTestData[0].id, 1);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to int properly.", obj.testVectOfTestDataMain.varVectOfTestData[1].id, 2);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to int properly.", obj.testVectOfTestDataMain.varVectOfTestData[2].id, 3);
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to String properly.", obj.testVectOfTestDataMain.varVectOfTestData[0].str, "test1");
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to String properly.", obj.testVectOfTestDataMain.varVectOfTestData[1].str, "test2");
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to String properly.", obj.testVectOfTestDataMain.varVectOfTestData[2].str, "test3");
		
		Assert.assertEquals("Vector of testData tag subtag 1 is not parsed to Number properly.", obj.testVectOfTestDataMain.varVectOfTestData[0].nr, 11.11);
		Assert.assertEquals("Vector of testData tag subtag 2 is not parsed to Number properly.", obj.testVectOfTestDataMain.varVectOfTestData[1].nr, 22.22);
		Assert.assertEquals("Vector of testData tag subtag 3 is not parsed to Number properly.", obj.testVectOfTestDataMain.varVectOfTestData[2].nr, 33.33);
	
	}

}
}