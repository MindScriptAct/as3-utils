package mindscriptact.utils.xml {
import flash.utils.describeType;
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;
import unit.xmlHelper.testObj.basic.VarBlankObj;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class XmlHelper {
	
	static public function parseXml(fillClass:Class, xmlFile:XML):Object {
		var retval:Object = new fillClass();
		if (fillClass == Boolean) {
			retval = false;
			var booleanVar:String = xmlFile.toString();
			if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
				retval = true;
			}
		} else if (fillClass == int) {
			retval = int(xmlFile.toString());
		} else if (fillClass == uint) {
			retval = uint(xmlFile.toString());
		} else if (fillClass == Number) {
			retval = Number(xmlFile.toString());
		} else if (fillClass == String) {
			retval = xmlFile.toString();
		} else if (fillClass == Dictionary) {
			retval = new Dictionary();
			fillObj(retval, xmlFile);
		} else if (fillClass == Object) {
			retval = new Object();
			fillObj(retval, xmlFile);
		} else {
			parseXmlToObject(retval, xmlFile);
		}
		return retval;
	}
	
	static public function parseXmlToObject(fillObject:Object, xmlFile:XML):void {
		var subList:XMLList;
		
		var classDescription:XML = describeType(fillObject.constructor);
		var variableList:XMLList = classDescription.factory.*.(name() == "variable" || name() == "accessor");
		
		var variableCount:int = variableList.length();
		for (var i:int = 0; i < variableCount; i++) {
			
			var variableType:String = variableList[i].@type;
			
			var memberValue:Object = null;
			
			// check if its vertor
			if (variableType.indexOf("__AS3__.vec::Vector") != -1) {
				
				// init vector
				memberValue = fillObject[variableList[i].@name];
				if (memberValue == null) {
					var vectClass:Class = getDefinitionByName(variableType) as Class;
					memberValue = new vectClass();
				}
				
				// get vector element type.
				var childSplitArr:Array = variableType.split("<");
				var childType:String = childSplitArr[childSplitArr.length - 1].split(">")[0];
				var clildClass:Class = getDefinitionByName(childType) as Class;
				
				// get elements with same name as vector var name.
				var vectorHolderList:XMLList = xmlFile[variableList[i].@name];
				
				// if element is single, without arguments, and with children - treat it as main node, and treat childs as items.
				if (vectorHolderList.length() == 1) {
					var vectorItimList:XMLList = vectorHolderList[0].children();
					for (var j:int = 0; j < vectorItimList.length(); j++) {
						var childObject:Object = parseXml(clildClass, vectorItimList[j]);
						memberValue.push(childObject);
					}
				} else if (vectorHolderList.length() > 1) { // treat every child as item of vector.
					//treat nodes AS object elements.
					for (var k:int = 0; k < vectorHolderList.length(); k++) {
						childObject = new clildClass();
						parseXmlToObject(childObject, vectorHolderList[k])
						memberValue.push(childObject);
					}
				}
				
			} else if (variableType == "Boolean") {
				memberValue = false;
				var booleanVar:String = String(xmlFile["@" + variableList[i].@name]);
				if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
					memberValue = true;
				} else {
					subList = xmlFile[variableList[i].@name];
					if (subList.length() == 1) {
						booleanVar = subList[0].toString();
						if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
							memberValue = true;
						}
					}
				}
				
			} else if (variableType == "int") {
				memberValue = int(xmlFile["@" + variableList[i].@name]);
				if (memberValue == 0) {
					subList = xmlFile[variableList[i].@name];
					if (subList.length() == 1) {
						memberValue = int(subList[0].toString());
					}
				}
				
			} else if (variableType == "uint") {
				memberValue = uint(xmlFile["@" + variableList[i].@name]);
				if (memberValue == 0) {
					subList = xmlFile[variableList[i].@name];
					if (subList.length() == 1) {
						memberValue = uint(subList[0].toString());
					}
				}
				
			} else if (variableType == "Number") {
				memberValue = Number(xmlFile["@" + variableList[i].@name]);
				if (memberValue == 0) {
					subList = xmlFile[variableList[i].@name];
					if (subList.length() == 1) {
						memberValue = Number(subList[0].toString());
					}
				}
				
			} else if (variableType == "String") {
				memberValue = String(xmlFile["@" + variableList[i].@name]);
				if (memberValue == "") {
					subList = xmlFile[variableList[i].@name];
					if (subList.length() == 1) {
						memberValue = subList[0].toString();
					}
				}
				
			} else if (variableType == "flash.utils::Dictionary" || variableType == "Object") {
				
				// init object
				memberValue = fillObject[variableList[i].@name];
				if (memberValue == null) {
					if (variableType == "Object") {
						memberValue = new Object();
					} else {
						memberValue = new Dictionary();
					}
				}
				// get dictionary tag
				var dictList:XMLList = xmlFile[variableList[i].@name];
				
				var dictTagCount:int = dictList.length();
				if (dictTagCount == 1) {
					var dictXml:XML = dictList[0];
					// get all attributes
					
					fillObj(memberValue, dictXml);
					
				} else if (dictTagCount == 0) {
					// 
				} else if (dictTagCount > 1) {
					throw Error("You have more then one tag for dictionary with var name:" + variableList[i].@name + " Please use only one.");
				}
				
			} else {
				//trace("variableType : " + variableType);
				var objectClass:Class = getDefinitionByName(variableType) as Class;
				if (objectClass) {
					memberValue = new objectClass();
					var objectNodes:XMLList = xmlFile[variableList[i].@name];
					if (objectNodes.length() > 0) {
						parseXmlToObject(memberValue, objectNodes[0]);
					}
				} else {
					throw Error("cant handle this type: " + variableType);
				}
				
			}
			
			fillObject[variableList[i].@name] = memberValue;
			
		}
	}
	
	static private function fillObj(value:Object, objXml:XML):void {
		var dictXmlAttribs:XMLList = objXml.attributes();
		var attribCount:int = dictXmlAttribs.length();
		for (var l:int = 0; l < attribCount; l++) {
			var attribXml:XML = dictXmlAttribs[l];
			if (!attribXml.hasComplexContent()) {
				value[String(attribXml.localName())] = attribXml.toString();
			}
		}
		// get all sub Tags. (use simple tags)
		var subTags:XMLList = objXml.children();
		var childCount:int = subTags.length();
		for (var m:int = 0; m < childCount; m++) {
			var childXml:XML = subTags[m];
			if (!childXml.hasComplexContent()) {
				value[String(childXml.localName())] = childXml.toString();
			}
		}
	}
	
	//----------------------------------
	//     debug
	//----------------------------------
	
	static public function traceObjFromXml(fillClass:Class, xmlFile:XML):String {
		
		var retVal:String = "Chacking " + fillClass + " with given xml...";
		trace(retVal);
		
		var testObj:Object = parseXml(fillClass, xmlFile);
		
		var traceRegisty:TraceRegisty = new TraceRegisty();
		
		analizeXml(testObj, fillClass, xmlFile, traceRegisty);
		
		var misingVars:String = traceRegisty.traceMissingVars();
		retVal += "\n" + misingVars;
		
		if (misingVars != "") {
			trace("\n" + misingVars);
		} else {
			trace("... all is good.\n");
		}
		
		return retVal;
	}
	
	static private function analizeXml(testObj:Object, fillClass:Class, xmlFile:XML, traceRegisty:TraceRegisty):void {
		var objectParsed:Boolean;
		var name:String;
		
		var attribList:XMLList = xmlFile.attributes();
		var attribCount:int = attribList.length();
		for (var i:int = 0; i < attribCount; i++) {
			var attribXml:XML = attribList[i];
			name = attribXml.localName();
			try {
				objectParsed = testObj[name] != null;
			} catch (error:Error) {
				objectParsed = false;
			}
			if (!objectParsed) {
				traceRegisty.addMisigVarible(fillClass, name, guessType(attribXml));
			}
		}
		
		var childList:XMLList = xmlFile.children();
		var childCount:int = childList.length();
		for (var j:int = 0; j < childCount; j++) {
			var childXml:XML = childList[j];
			name = childXml.localName();
			try {
				objectParsed = testObj[name] != null;
				
				var objClass:Class = Object(testObj[name]).constructor;
				
				analizeXml(testObj[name], objClass, childXml, traceRegisty);
				
			} catch (error:Error) {
				objectParsed = false;
			}
			if (!objectParsed) {
				traceRegisty.addMisigVarible(fillClass, name, guessType(childXml));
			}
		}
	
	}
	
	static private function guessType(dataXml:XML):String {
		var retVal:String = "Object";
		
		var attributes:XMLList = dataXml.attributes();
		
		if (!dataXml.hasComplexContent() && attributes.length() == 0) {
			retVal = "String";
			
			var data:String = dataXml.toString();
			
			// int
			var intTest:int = int(data);
			if (data == String(intTest)) {
				retVal = "int";
			} else {
				// Number
				var numberTest:Number = Number(data);
				if (data == String(numberTest)) {
					retVal = "Number";
				}
			}
			
			// Boolean
			if (data == "true" || data == "false" || data == "TRUE" || data == "FALSE") {
				retVal = "Boolean";
			}
			
		}
		
		return retVal;
	}
	
	//----------------------------------
	//     fill xml from object, and trace it.
	//----------------------------------
	
	static public function traceXmlFromObj(data:Object, xml:XML, isRoot:Boolean = true):XML {
		var attribList:XMLList;
		var mainChild:XML;
		var child:XML;
		var childList:XMLList;
		var xmlNode:XML;
		// TODO : rename to retVal.
		var xmlFile:XML = new XML(xml);
		
		var dataClass:Class = data.constructor;
		
		var classDescription:XML = describeType(dataClass);
		var variableList:XMLList = classDescription.factory.*.(name() == "variable" || name() == "accessor");
		
		var variableCount:int = variableList.length();
		for (var i:int = 0; i < variableCount; i++) {
			
			var variableType:String = variableList[i].@type;
			var variableName:String = variableList[i].@name;
			var variableValue:Object = data[variableList[i].@name];
			
			// check if its vertor
			if (variableType.indexOf("__AS3__.vec::Vector") != -1) {
				
					// init vector
					//memberValue = fillObject[variableList[i].@name];
					//if (memberValue == null) {
					//var vectClass:Class = getDefinitionByName(variableType) as Class;
					//memberValue = new vectClass();
					//}
					//
					// get vector element type.
					//var childSplitArr:Array = variableType.split("<");
					//var childType:String = childSplitArr[childSplitArr.length - 1].split(">")[0];
					//var clildClass:Class = getDefinitionByName(childType) as Class;
					//
					// get elements with same name as vector var name.
					//var vectorHolderList:XMLList = xmlFile[variableList[i].@name];
					//
					// if element is single, without arguments, and with children - treat it as main node, and treat childs as items.
					//if (vectorHolderList.length() == 1) {
					//var vectorItimList:XMLList = vectorHolderList[0].children();
					//for (var j:int = 0; j < vectorItimList.length(); j++) {
					//var childObject:Object = parseXml(clildClass, vectorItimList[j]);
					//memberValue.push(childObject);
					//}
					//} else if (vectorHolderList.length() > 1) { // treat every child as item of vector.
					//treat nodes AS object elements.
					//for (var k:int = 0; k < vectorHolderList.length(); k++) {
					//childObject = new clildClass();
					//parseXmlToObject(childObject, vectorHolderList[k])
					//memberValue.push(childObject);
					//}
					//}
				
			} else if (variableType == "int" || variableType == "uint" || variableType == "Number" || variableType == "String" || variableType == "Boolean") {
				attribList = xmlFile["@" + variableList[i].@name];
				if (attribList.length() == 1) {
					xmlFile["@" + variableList[i].@name] = variableValue;
				} else {
					childList = xmlFile[variableList[i].@name];
					if (childList.length() == 1) {
						child = childList[0];
						child.appendChild(variableValue);
					} else {
						if (isRoot) {
							xmlFile[variableList[i].@name] = variableValue;
						} else {
							xmlFile["@" + variableList[i].@name] = variableValue;
						}
					}
				}
				
			} else if (variableType == "flash.utils::Dictionary" || variableType == "Object") {
				var mainChilds:XMLList = xmlFile[variableList[i].@name];
				if (mainChilds.length() == 0) {
					xmlFile[variableList[i].@name] = "";
					mainChild = xmlFile[variableList[i].@name][0];
				} else if (mainChilds.length() == 1) {
					mainChild = mainChilds[0];
				} else {
					throw Error("Dictionary tag [" + variableList[i].@name + "] should be used only once.");
				}
				
				for (var itemName:String in variableValue) {
					
					attribList = mainChild["@" + itemName];
					if (attribList.length() == 1) {
						mainChild["@" + itemName] = variableValue[itemName];
					} else {
						mainChild[itemName] = variableValue[itemName];
					}
				}
				
			} else {
				//trace("variableType : " + variableType);
				//var objectClass:Class = getDefinitionByName(variableType) as Class;
				//if (objectClass) {
				//memberValue = new objectClass();
				//var objectNodes:XMLList = xmlFile[variableList[i].@name];
				//if (objectNodes.length() > 0) {
				//parseXmlToObject(memberValue, objectNodes[0]);
				//}
				//} else {
				//throw Error("cant handle this type: " + variableType);
				//}
				
			}
			
		}
		
		trace("Data object " + data + " converts to XML :\n", xmlFile.toString());
		
		return xmlFile;
	}

}
}

import flash.utils.Dictionary;

class TraceRegisty {
	
	private var objectRegisty:Dictionary = new Dictionary();
	
	public function addMisigVarible(objClass:Class, name:String, type:String):void {
		var objectClasses:Vector.<String> = objectRegisty[String(objClass)];
		if (!objectClasses) {
			objectClasses = new Vector.<String>();
			objectRegisty[String(objClass)] = objectClasses;
		}
		objectClasses.push("\t" + "public var " + name + ":" + type + ";");
	}
	
	public function traceMissingVars():String {
		var retVal:String = "";
		
		for (var objClass:String in objectRegisty) {
			var objectClasses:Vector.<String> = objectRegisty[objClass];
			
			retVal += " !!! Class " + objClass + " has these missing variables:\n\n";
			
			for (var i:int = 0; i < objectClasses.length; i++) {
				retVal += objectClasses[i] + "\n";
			}
			
			retVal += "\n";
		}
		
		return retVal;
	}
}

