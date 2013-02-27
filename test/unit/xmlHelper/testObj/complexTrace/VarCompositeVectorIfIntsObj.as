package unit.xmlHelper.testObj.complexTrace {
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author rBanevicius
 */
public class VarCompositeVectorIfIntsObj {
	
	public var testVectOfIntMain:VarVectorOfInts = new VarVectorOfInts();
	
	public function VarCompositeVectorIfIntsObj() {
		testVectOfIntMain.varVectOfInts = new Vector.<int>();
		testVectOfIntMain.varVectOfInts.push(123456);
	}

}
}