package unit.xmlHelper.testObj.complexTrace {
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author rBanevicius
 */
public class VarCompositeBooleanObj {
	
	public var testBooleanMain:VarBooleanObj = new VarBooleanObj();
	
	public function VarCompositeBooleanObj() {
		testBooleanMain.testBoolean = true;
	}
}
}