package unit.xmlHelper.testObj.vectorsTrace {
import unit.xmlHelper.testObj.complex.VarTestData;

public class VarVectorOfDataTestData {
	
	public var varVectOfTestData:Vector.<VarVectTestData>;
	
	public function VarVectorOfDataTestData() {
		varVectOfTestData = new Vector.<VarVectTestData>();
		varVectOfTestData.push(new VarVectTestData());
	}

}
}