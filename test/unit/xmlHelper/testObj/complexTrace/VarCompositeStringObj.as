package unit.xmlHelper.testObj.complexTrace {
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author rBanevicius
 */
public class VarCompositeStringObj {
	
	public var testStringMain:VarStringObj = new VarStringObj();
	
	public function VarCompositeStringObj() {
		testStringMain.testString = "abc123";
	}

}
}