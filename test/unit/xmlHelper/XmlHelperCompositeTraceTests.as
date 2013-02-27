package unit.xmlHelper {
import flexunit.framework.*;
import mindscriptact.utils.xml.*;
import unit.xmlHelper.testObj.complexTrace.*;
import unit.xmlHelper.testObj.dataTrace.*;
import unit.xmlHelper.testObj.vectorsTrace.*;

/**
 * COMMENT
 * @author
 */
public class XmlHelperCompositeTraceTests {
	
	[Before]
	
	public function runBeforeEveryTest():void {
	}
	
	[After]
	
	public function runAfterEveryTest():void {
	}
	
	//----------------------------------
	//     complex object with int
	//----------------------------------
	
	[Test(expects="Error")]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithIntDoubleMainTag_fails():void {
		
		var xmlIn:XML =
			<data>
				<testIntMain/>
				<testIntMain/>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testIntMain testInt="12345"/>
			</data>;
		
		var data:VarCompositeIntObj = new VarCompositeIntObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithInt_ok():void {
		
		var xmlIn:XML =
			<data>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testIntMain testInt="1234"/>
			</data>;
		
		var data:VarCompositeIntObj = new VarCompositeIntObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithIntMainTag_ok():void {
		
		var xmlIn:XML =
			<data>
				<testIntMain/>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testIntMain testInt="1234"/>
			</data>;
		
		var data:VarCompositeIntObj = new VarCompositeIntObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithIntMainTagAndAttribute_ok():void {
		
		var xmlIn:XML =
			<data>
				<testIntMain testInt=""/>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testIntMain testInt="1234"/>
			</data>;
		
		var data:VarCompositeIntObj = new VarCompositeIntObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     boolean
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithBoolean_ok():void {
		
		var xmlIn:XML =
			<data>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testBooleanMain testBoolean="true"/>
			</data>;
		
		var data:VarCompositeBooleanObj = new VarCompositeBooleanObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     String
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithString_ok():void {
		
		var xmlIn:XML =
			<data>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testStringMain testString="abc123"/>
			</data>;
		
		var data:VarCompositeStringObj = new VarCompositeStringObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Dictionary
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithDictionary_ok():void {
		
		var xmlIn:XML =
			<data>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testDictionaryMain>
					<testDictionary>
						<testData>abc123</testData>
					</testDictionary>
				</testDictionaryMain>
			</data>;
		
		var data:VarCompositeDictionaryObj = new VarCompositeDictionaryObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Vector of ints
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithVectorOfInts_ok():void {
		
		var xmlIn:XML =
			<data>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testVectOfIntMain>
					<varVectOfInts>
						<item>123456</item>
					</varVectOfInts>
				</testVectOfIntMain>
			</data>;
		
		var data:VarCompositeVectorIfIntsObj = new VarCompositeVectorIfIntsObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Vector of data
	//----------------------------------
	
	[Test]
	
	public function xmlHelper_traceXmlFromObjectWithSubobjectWithVectorOfTestData_ok():void {
		
		var xmlIn:XML =
			<data>
			</data>;
		
		var xmlResult:XML =
			<data>
				<testVectOfTestDataMain>
					<varVectOfTestData>
						<item testString="abc123"/>
					</varVectOfTestData>
				</testVectOfTestDataMain>
			</data>;
		
		var data:VarCompositeVectorIfTestDataObj = new VarCompositeVectorIfTestDataObj();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}

}
}