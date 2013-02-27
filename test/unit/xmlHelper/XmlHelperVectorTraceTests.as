package unit.xmlHelper {
import flexunit.framework.*;
import mindscriptact.utils.xml.*;
import unit.xmlHelper.testObj.dataTrace.*;
import unit.xmlHelper.testObj.vectorsTrace.*;

/**
 * COMMENT
 * @author
 */
public class XmlHelperVectorTraceTests {
	
	[Before]
	
	public function runBeforeEveryTest():void {
	}
	
	[After]
	
	public function runAfterEveryTest():void {
	}
	
	//----------------------------------
	//     Vector of objects
	//----------------------------------
	
	[Test(expects="Error")]
	
	public function xmlHelper_traceXmlFromVectorVectorDublicatedVar_fails():void {
		
		var xmlIn:XML = 
			<data>
				<varVectOfTestData>
				</varVectOfTestData>
				<varVectOfTestData>
				</varVectOfTestData>				
			</data>;
		
		var data:VarVectorOfDataTestData = new VarVectorOfDataTestData();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
	
	}
	
	[Test(expects="Error")]
	
	public function xmlHelper_traceXmlFromVectorVectorItemTagDifers_fails():void {
		
		var xmlIn:XML = 
			<data>
				<varVectOfTestData>
					<item/>
					<testItem/>
				</varVectOfTestData>			
			</data>;
		
		var data:VarVectorOfDataTestData = new VarVectorOfDataTestData();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromVectorVectorVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<varVectOfTestData>
					<item testString="abc123"/>
				</varVectOfTestData>
			</data>;
		
		var data:VarVectorOfDataTestData = new VarVectorOfDataTestData();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromVectorVectorSingeVar_ok():void {
		
		var xmlIn:XML = 
			<data>
				<varVectOfTestData>
				</varVectOfTestData>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<varVectOfTestData>
					<item testString="abc123"/>
				</varVectOfTestData>
			</data>;
		
		var data:VarVectorOfDataTestData = new VarVectorOfDataTestData();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromVectorVectorSingeVarWithSubnodes_ok():void {
		
		var xmlIn:XML = 
			<data>
				<varVectOfTestData>
					<testItem/>
				</varVectOfTestData>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<varVectOfTestData>
					<testItem testString="abc123"/>
				</varVectOfTestData>
			</data>;
		
		var data:VarVectorOfDataTestData = new VarVectorOfDataTestData();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromVectorVectorSingeVarWithAttributes_ok():void {
		
		var xmlIn:XML = 
			<data>
				<varVectOfTestData>
					<testItem>
						<testString></testString>
					</testItem>
				</varVectOfTestData>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<varVectOfTestData>
					<testItem>
						<testString>abc123</testString>
					</testItem>
				</varVectOfTestData>
			</data>;
		
		var data:VarVectorOfDataTestData = new VarVectorOfDataTestData();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	//----------------------------------
	//     Vector of basic elements
	//----------------------------------
	
	[Test]
	
	//
	public function xmlHelper_traceXmlFromVectorVectorWithIntsVar_ok():void {
		
		var xmlIn:XML = 
			<data>
			</data>;
		
		var xmlResult:XML = 
			<data>
				<varVectOfInt>
					<item>12345</item>
				</varVectOfInt>
			</data>;
		
		var data:VarVectorOfDataInt = new VarVectorOfDataInt();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromVectorVectorWithIntsSingeVar_ok():void {
		
		var xmlIn:XML =
			<data>
				<varVectOfInt>
				</varVectOfInt>
			</data>;
		
		var xmlResult:XML =   
			<data> 
				<varVectOfInt>
					<item>12345</item>
				</varVectOfInt>
			</data>;
		
		var data:VarVectorOfDataInt = new VarVectorOfDataInt();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}
	
	[Test]
	
	public function xmlHelper_traceXmlFromVectorVectorWithIntsSingeVarWithSubnodes_ok():void {
		
		var xmlIn:XML =
			<data>
				<varVectOfInt>
					<testItem/>
				</varVectOfInt>
			</data>;
		
		var xmlResult:XML =    
			<data> 
				<varVectOfInt>
					<testItem>12345</testItem>
				</varVectOfInt>
			</data>;
		
		var data:VarVectorOfDataInt = new VarVectorOfDataInt();
		
		var xmlOut:XML = XmlHelper.traceXmlFromObj(data, xmlIn);
		
		Assert.assertEquals("Tracing xml failed. Vector is not traced corectly.", xmlResult, xmlOut);
	
	}

}
}