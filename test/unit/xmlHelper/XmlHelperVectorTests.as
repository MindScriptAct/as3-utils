package unit.xmlHelper {
import flexunit.framework.*;
import mindscriptact.utils.xml.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.complex.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author
 */
public class XmlHelperVectorTests {
	
	[Before]
	
	public function runBeforeEveryTest():void {
	}
	
	[After]
	
	public function runAfterEveryTest():void {
	}
	
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
		
		var obj:VarVectorOfInts = XmlHelper.parseXml(VarVectorOfInts, xml) as VarVectorOfInts;
		
		Assert.assertNotNull("Not initialized vector must be created.", obj.varVectOfInts);
	}
	
	[Test]
	
	public function xmlHelper_vectorOfCustomObjectsVariablesInSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfTestData>
					<item id="1" str="test1" nr="11.11"/>
					<item id="2" str="test2" nr="22.22"/>
					<item id="3" str="test3" nr="33.33"/>
				</varVectOfTestData>
			</data>;
		
		var obj:VarVectorOfTestData = XmlHelper.parseXml(VarVectorOfTestData, xml) as VarVectorOfTestData;
		
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
	
	public function xmlHelper_vectorOfCustomObjectsVariablesInSubSubTag_ok():void {
		
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
		
		var obj:VarVectorOfTestData = XmlHelper.parseXml(VarVectorOfTestData, xml) as VarVectorOfTestData;
		
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
	
	public function xmlHelper_vectorOfBooleanssVariablesInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<varVectOfBooleans>
					<item>true</item>
					<item>TRUE</item>
					<item>1</item>
					<item>false</item>
					<item>FALSE</item>
					<item>0</item>					
				</varVectOfBooleans>
			</data>;
		
		var obj:VarVectorOfBooleans = XmlHelper.parseXml(VarVectorOfBooleans, xml) as VarVectorOfBooleans;
		
		Assert.assertEquals("Vector of Booleans tag subtag is not parsed to Boolean object.", obj.varVectOfBooleans[0], true);
		Assert.assertEquals("Vector of Booleans tag subtag is not parsed to Boolean object.", obj.varVectOfBooleans[1], true);
		Assert.assertEquals("Vector of Booleans tag subtag is not parsed to Boolean object.", obj.varVectOfBooleans[2], true);
		Assert.assertEquals("Vector of Booleans tag subtag is not parsed to Boolean object.", obj.varVectOfBooleans[3], false);
		Assert.assertEquals("Vector of Booleans tag subtag is not parsed to Boolean object.", obj.varVectOfBooleans[4], false);
		Assert.assertEquals("Vector of Booleans tag subtag is not parsed to Boolean object.", obj.varVectOfBooleans[5], false);
	
	}
	
	[Test]
	
	public function xmlHelper_vectorOfIntsVariablesInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<varVectOfInts>
					<item>-111</item>
					<item>222</item>
					<item>-333</item>
				</varVectOfInts>
			</data>;
		
		var obj:VarVectorOfInts = XmlHelper.parseXml(VarVectorOfInts, xml) as VarVectorOfInts;
		
		Assert.assertEquals("Vector of ints tag subtag is not parsed to Vector object.", obj.varVectOfInts[0], -111);
		Assert.assertEquals("Vector of ints tag subtag is not parsed to Vector object.", obj.varVectOfInts[1], 222);
		Assert.assertEquals("Vector of ints tag subtag is not parsed to Vector object.", obj.varVectOfInts[2], -333);
	}
	
	[Test]
	
	public function xmlHelper_vectorOfUintsVariablesInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<varVectOfUints>
					<item>111</item>
					<item>222</item>
					<item>333</item>
				</varVectOfUints>
			</data>;
		
		var obj:VarVectorOfUints = XmlHelper.parseXml(VarVectorOfUints, xml) as VarVectorOfUints;
		
		Assert.assertEquals("Vector of uints tag subtag is not parsed to Vector object.", obj.varVectOfUints[0], 111);
		Assert.assertEquals("Vector of uints tag subtag is not parsed to Vector object.", obj.varVectOfUints[1], 222);
		Assert.assertEquals("Vector of uints tag subtag is not parsed to Vector object.", obj.varVectOfUints[2], 333);
	}
	
	[Test]
	
	public function xmlHelper_vectorOfNumbersVariablesInSubTag_ok():void {
		
		var xml:XML = 
			<data>
				<varVectOfNumbers>
					<item>111</item>
					<item>222</item>
					<item>333</item>
				</varVectOfNumbers>
			</data>;
		
		var obj:VarVectorOfNumbers = XmlHelper.parseXml(VarVectorOfNumbers, xml) as VarVectorOfNumbers;
		
		Assert.assertEquals("Vector of Numbers tag subtag is not parsed to Vector object.", obj.varVectOfNumbers[0], 111);
		Assert.assertEquals("Vector of Numbers tag subtag is not parsed to Vector object.", obj.varVectOfNumbers[1], 222);
		Assert.assertEquals("Vector of Numbers tag subtag is not parsed to Vector object.", obj.varVectOfNumbers[2], 333);
	}
	
	///
	
	[Test]
	
	public function xmlHelper_vectorOfObjectsVariablesInSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfObject>
					<item id="1" str="test1" nr="11.11"/>
					<item id="2" str="test2" nr="22.22"/>
					<item id="3" str="test3" nr="33.33"/>
				</varVectOfObject>
			</data>;
		
		var obj:VarVectorOfObject = XmlHelper.parseXml(VarVectorOfObject, xml) as VarVectorOfObject;
		
		Assert.assertEquals("Vector of Object tag subtag 1 is not parsed to int properly.", obj.varVectOfObject[0]["id"], "1");
		Assert.assertEquals("Vector of Object tag subtag 2 is not parsed to int properly.", obj.varVectOfObject[1]["id"], "2");
		Assert.assertEquals("Vector of Object tag subtag 3 is not parsed to int properly.", obj.varVectOfObject[2]["id"], "3");
		
		Assert.assertEquals("Vector of Object tag subtag 1 is not parsed to String properly.", obj.varVectOfObject[0]["str"], "test1");
		Assert.assertEquals("Vector of Object tag subtag 2 is not parsed to String properly.", obj.varVectOfObject[1]["str"], "test2");
		Assert.assertEquals("Vector of Object tag subtag 3 is not parsed to String properly.", obj.varVectOfObject[2]["str"], "test3");
		
		Assert.assertEquals("Vector of Object tag subtag 1 is not parsed to Number properly.", obj.varVectOfObject[0]["nr"], "11.11");
		Assert.assertEquals("Vector of Object tag subtag 2 is not parsed to Number properly.", obj.varVectOfObject[1]["nr"], "22.22");
		Assert.assertEquals("Vector of Object tag subtag 3 is not parsed to Number properly.", obj.varVectOfObject[2]["nr"], "33.33");
	
	}
	
	[Test]
	
	public function xmlHelper_vectorOfObjectsVariablesInSubSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfObject>
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
				</varVectOfObject>
			</data>;
		
		var obj:VarVectorOfObject = XmlHelper.parseXml(VarVectorOfObject, xml) as VarVectorOfObject;
		
		Assert.assertEquals("Vector of Object tag subtag 1 is not parsed to int properly.", obj.varVectOfObject[0]["id"], "1");
		Assert.assertEquals("Vector of Object tag subtag 2 is not parsed to int properly.", obj.varVectOfObject[1]["id"], "2");
		Assert.assertEquals("Vector of Object tag subtag 3 is not parsed to int properly.", obj.varVectOfObject[2]["id"], "3");
		
		Assert.assertEquals("Vector of Object tag subtag 1 is not parsed to String properly.", obj.varVectOfObject[0]["str"], "test1");
		Assert.assertEquals("Vector of Object tag subtag 2 is not parsed to String properly.", obj.varVectOfObject[1]["str"], "test2");
		Assert.assertEquals("Vector of Object tag subtag 3 is not parsed to String properly.", obj.varVectOfObject[2]["str"], "test3");
		
		Assert.assertEquals("Vector of Object tag subtag 1 is not parsed to Number properly.", obj.varVectOfObject[0]["nr"], "11.11");
		Assert.assertEquals("Vector of Object tag subtag 2 is not parsed to Number properly.", obj.varVectOfObject[1]["nr"], "22.22");
		Assert.assertEquals("Vector of Object tag subtag 3 is not parsed to Number properly.", obj.varVectOfObject[2]["nr"], "33.33");
	
	}
	
	[Test]
	
	public function xmlHelper_vectorOfDictsVariablesInSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfDicts>
					<item id="1" str="test1" nr="11.11"/>
					<item id="2" str="test2" nr="22.22"/>
					<item id="3" str="test3" nr="33.33"/>
				</varVectOfDicts>
			</data>;
		
		var obj:VarVectorOfDicts = XmlHelper.parseXml(VarVectorOfDicts, xml) as VarVectorOfDicts;
		
		Assert.assertEquals("Vector of Dictionary tag subtag 1 is not parsed to int properly.", obj.varVectOfDicts[0]["id"], "1");
		Assert.assertEquals("Vector of Dictionary tag subtag 2 is not parsed to int properly.", obj.varVectOfDicts[1]["id"], "2");
		Assert.assertEquals("Vector of Dictionary tag subtag 3 is not parsed to int properly.", obj.varVectOfDicts[2]["id"], "3");
		
		Assert.assertEquals("Vector of Dictionary tag subtag 1 is not parsed to String properly.", obj.varVectOfDicts[0]["str"], "test1");
		Assert.assertEquals("Vector of Dictionary tag subtag 2 is not parsed to String properly.", obj.varVectOfDicts[1]["str"], "test2");
		Assert.assertEquals("Vector of Dictionary tag subtag 3 is not parsed to String properly.", obj.varVectOfDicts[2]["str"], "test3");
		
		Assert.assertEquals("Vector of Dictionary tag subtag 1 is not parsed to Number properly.", obj.varVectOfDicts[0]["nr"], "11.11");
		Assert.assertEquals("Vector of Dictionary tag subtag 2 is not parsed to Number properly.", obj.varVectOfDicts[1]["nr"], "22.22");
		Assert.assertEquals("Vector of Dictionary tag subtag 3 is not parsed to Number properly.", obj.varVectOfDicts[2]["nr"], "33.33");
	
	}
	
	[Test]
	
	public function xmlHelper_vectorOfDictsVariablesInSubSubTag_ok():void {
		
		var xml:XML =
			<data>
				<varVectOfDicts>
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
				</varVectOfDicts>
			</data>;
		
		var obj:VarVectorOfDicts = XmlHelper.parseXml(VarVectorOfDicts, xml) as VarVectorOfDicts;
		
		Assert.assertEquals("Vector of Dictionary tag subtag 1 is not parsed to int properly.", obj.varVectOfDicts[0]["id"], "1");
		Assert.assertEquals("Vector of Dictionary tag subtag 2 is not parsed to int properly.", obj.varVectOfDicts[1]["id"], "2");
		Assert.assertEquals("Vector of Dictionary tag subtag 3 is not parsed to int properly.", obj.varVectOfDicts[2]["id"], "3");
		
		Assert.assertEquals("Vector of Dictionary tag subtag 1 is not parsed to String properly.", obj.varVectOfDicts[0]["str"], "test1");
		Assert.assertEquals("Vector of Dictionary tag subtag 2 is not parsed to String properly.", obj.varVectOfDicts[1]["str"], "test2");
		Assert.assertEquals("Vector of Dictionary tag subtag 3 is not parsed to String properly.", obj.varVectOfDicts[2]["str"], "test3");
		
		Assert.assertEquals("Vector of Dictionary tag subtag 1 is not parsed to Number properly.", obj.varVectOfDicts[0]["nr"], "11.11");
		Assert.assertEquals("Vector of Dictionary tag subtag 2 is not parsed to Number properly.", obj.varVectOfDicts[1]["nr"], "22.22");
		Assert.assertEquals("Vector of Dictionary tag subtag 3 is not parsed to Number properly.", obj.varVectOfDicts[2]["nr"], "33.33");
	
	}

}
}