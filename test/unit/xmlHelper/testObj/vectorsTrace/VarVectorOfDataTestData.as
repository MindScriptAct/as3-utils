package unit.xmlHelper.testObj.vectorsTrace {
import unit.xmlHelper.testObj.complex.VarTestData;

public class VarVectorOfDataTestData {
	
	public var varVectOfTestData:Vector.<VarVectTestData> = new Vector.<VarVectTestData>();
	
	public function VarVectorOfDataTestData() {
		varVectOfTestData.push(new VarVectTestData());
	}

}
}