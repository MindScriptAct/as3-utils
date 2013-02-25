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
	
	[Test]
	
	public function xmlHelper_mainObjectVars_ok():void {
		
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
	
	public function xmlHelper_subObjectVars_ok():void {
		
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

}
}