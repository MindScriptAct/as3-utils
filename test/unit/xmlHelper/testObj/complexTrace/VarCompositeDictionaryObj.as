package unit.xmlHelper.testObj.complexTrace {
import flash.utils.Dictionary;
import unit.xmlHelper.testObj.*;
import unit.xmlHelper.testObj.basic.*;
import unit.xmlHelper.testObj.vectors.*;

/**
 * COMMENT
 * @author rBanevicius
 */
public class VarCompositeDictionaryObj {
	
	public var testDictionaryMain:VarDictionaryObj = new VarDictionaryObj();
	
	public function VarCompositeDictionaryObj() {
		testDictionaryMain.testDictionary = new Dictionary();
		testDictionaryMain.testDictionary["testData"] = "abc123";
	}

}
}