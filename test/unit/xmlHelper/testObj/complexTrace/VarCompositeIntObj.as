package unit.xmlHelper.testObj.complexTrace {
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author rBanevicius
 */
public class VarCompositeIntObj {
	
	public var testIntMain:VarIntObj = new VarIntObj();
	
	public function VarCompositeIntObj() {
		testIntMain.testInt = 1234;
	}

}
}