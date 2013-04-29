package mindscriptact.utils.xml {
import flash.utils.describeType;
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;
import unit.xmlHelper.testObj.basic.VarBlankObj;

/**
 * Helper that parse xml data to object, and have functions to generate Class attributes from xml, and generate xml from Object.
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class XmlHelper {
	
	/**
	 * Creates object for provided class, and fills it with data from xml.
	 * @param	fillClass	Class of object that holds data of xml file root.
	 * @param	xmlFile		Xml with data
	 * @return				OBject with data parsed from xml.
	 */
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
	
	/**
	 * Fills provided object with data from xml.
	 * @param	fillObject	Object that holds data of xml file root.
	 * @param	xmlFile		Xml with data
	 */
	static public function parseXmlToObject(fillObject:Object, xmlFile:XML):void {
		var subList:XMLList;
		
		var classDescription:XML = describeType(fillObject.constructor);
		var variableList:XMLList = classDescription.factory.*.(name() == "variable" || name() == "accessor");
		
		var variableCount:int = variableList.length();
		for (var i:int = 0; i < variableCount; i++) {
			
			var variable:XML = variableList[i];
			
			var variableType:String = variable.@type;
			
			var memberValue:Object = null;
			
			// check if its vertor
			if (variableType.indexOf("__AS3__.vec::Vector") != -1) {
				
				// init vector
				memberValue = fillObject[variable.@name];
				if (memberValue == null) {
					var vectClass:Class = getDefinitionByName(variableType) as Class;
					memberValue = new vectClass();
				}
				
				// get vector element type.
				var childSplitArr:Array = variableType.split("<");
				var childType:String = childSplitArr[childSplitArr.length - 1].split(">")[0];
				var clildClass:Class = getDefinitionByName(childType) as Class;
				
				// get elements with same name as vector var name.
				var vectorHolderList:XMLList = xmlFile[variable.@name];
				
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
				var booleanVar:String = String(xmlFile["@" + variable.@name]);
				if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
					memberValue = true;
				} else {
					subList = xmlFile[variable.@name];
					if (subList.length() == 1) {
						booleanVar = subList[0].toString();
						if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
							memberValue = true;
						}
					}
				}
				
			} else if (variableType == "int") {
				memberValue = int(xmlFile["@" + variable.@name]);
				if (memberValue == 0) {
					subList = xmlFile[variable.@name];
					if (subList.length() == 1) {
						memberValue = int(subList[0].toString());
					}
				}
				
			} else if (variableType == "uint") {
				memberValue = uint(xmlFile["@" + variable.@name]);
				if (memberValue == 0) {
					subList = xmlFile[variable.@name];
					if (subList.length() == 1) {
						memberValue = uint(subList[0].toString());
					}
				}
				
			} else if (variableType == "Number") {
				memberValue = Number(xmlFile["@" + variable.@name]);
				if (memberValue == 0) {
					subList = xmlFile[variable.@name];
					if (subList.length() == 1) {
						memberValue = Number(subList[0].toString());
					}
				}
				
			} else if (variableType == "String") {
				memberValue = String(xmlFile["@" + variable.@name]);
				if (memberValue == "") {
					subList = xmlFile[variable.@name];
					if (subList.length() == 1) {
						memberValue = subList[0].toString();
					}
				}
				
			} else if (variableType == "flash.utils::Dictionary" || variableType == "Object") {
				
				// init object
				memberValue = fillObject[variable.@name];
				if (memberValue == null) {
					if (variableType == "Object") {
						memberValue = new Object();
					} else {
						memberValue = new Dictionary();
					}
				}
				// get dictionary tag
				var dictList:XMLList = xmlFile[variable.@name];
				
				var dictTagCount:int = dictList.length();
				if (dictTagCount == 1) {
					var dictXml:XML = dictList[0];
					// get all attributes
					
					fillObj(memberValue, dictXml);
					
				} else if (dictTagCount == 0) {
					// 
				} else if (dictTagCount > 1) {
					throw Error("You have more then one tag for dictionary with var name:" + variable.@name + " Please use only one.");
				}
				
			} else {
				//trace("variableType : " + variableType);
				var objectClass:Class = getDefinitionByName(variableType) as Class;
				if (objectClass) {
					memberValue = new objectClass();
					var objectNodes:XMLList = xmlFile[variable.@name];
					if (objectNodes.length() > 0) {
						parseXmlToObject(memberValue, objectNodes[0]);
					}
				} else {
					throw Error("cant handle this type: " + variableType);
				}
				
			}
			
			fillObject[variable.@name] = memberValue;
			
		}
	}
	
	/**
	 * Function to fill dictionary or object.
	 * @private
	 * @param	value
	 * @param	objXml
	 */
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
	
	/**
	 * Will trace missing arguments in your class, that exists in provided xml.
	 * @param	fillClass
	 * @param	xmlFile
	 * @return
	 */
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
	
	/**
	 * Recursive funciton to analize xml.
	 * @private
	 * @param	testObj
	 * @param	fillClass
	 * @param	xmlFile
	 * @param	traceRegisty
	 */
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
	
	/**
	 * Tries to guess data type.
	 * @private
	 * @param	dataXml
	 * @return
	 */
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
	
	/**
	 * Traces XML from provided object data. (parsable by XmlHelper).
	 * @param	data
	 * @param	xml
	 * @param	isRoot
	 * @return
	 */
	static public function traceXmlFromObj(data:Object, xml:XML = null, isRoot:Boolean = true):XML {
		// TODO : rename to retVal.
		
		var xmlFile:XML;
		if (xml) {
			xmlFile = new XML(xml);
		} else {
			xmlFile = new XML("<data/>");
		}
		
		parseObject(data, xmlFile, isRoot);
		
		trace("Data object " + data + " converts to XML :\n", xmlFile.toString());
		
		return xmlFile;
	}
	
	/**
	 * Recursive object parser.
	 * @private
	 * @param	data
	 * @param	xmlFile
	 * @param	isRoot
	 */
	static private function parseObject(data:Object, xmlFile:XML, isRoot:Boolean):void {
		var itemName:String;
		var mainChilds:XMLList;
		
		var attribList:XMLList;
		var mainChild:XML;
		var child:XML;
		var childList:XMLList;
		var xmlNode:XML;
		
		if (data) {
			
			var dataClass:Class = data.constructor;
			
			var classDescription:XML = describeType(dataClass);
			var variableList:XMLList = classDescription.factory.*.(name() == "variable" || name() == "accessor");
			
			var variableCount:int = variableList.length();
			if (variableCount) {
				
				for (var i:int = 0; i < variableCount; i++) {
					
					var variable:XML = variableList[i];
					
					if (variable.@access != "writeonly") {
						
						var variableType:String = variable.@type;
						var variableName:String = variable.@name;
						var variableValue:Object = data[variable.@name];
						
						// check if its vertor
						if (variableType.indexOf("__AS3__.vec::Vector") != -1) {
							mainChilds = xmlFile[variable.@name];
							if (mainChilds.length() == 0) {
								xmlFile[variable.@name] = "";
								mainChild = xmlFile[variable.@name][0];
							} else if (mainChilds.length() == 1) {
								mainChild = mainChilds[0];
							} else {
								throw Error("Vector tag (" + variable.@name + ") should be used only once.");
							}
							childList = mainChild.children();
							
							// check item names.
							var childCount:int = childList.length();
							var vectItemName:String;
							for (var k:int = 0; k < childCount; k++) {
								itemName = (childList[k] as XML).localName() as String
								if (vectItemName) {
									if (vectItemName != itemName) {
										throw Error("Vector (" + variable.@name + ") items should have same item names. 2 diferent names found : " + vectItemName + ", " + itemName);
									}
								} else {
									vectItemName = itemName;
								}
							}
							if (!vectItemName) {
								vectItemName = "item";
							}
							
							var itemLenght:int = variableValue.length;
							for (var j:int = 0; j < itemLenght; j++) {
								var vectorItem:Object = variableValue[j];
								
								if (j < childCount) {
									child = childList[j];
								} else {
									child = new XML("<" + vectItemName + "/>");
									mainChild.appendChild(child);
								}
								parseObject(vectorItem, child, false);
							}
							
						} else if (variableType == "int" || variableType == "uint" || variableType == "Number" || variableType == "String" || variableType == "Boolean") {
							attribList = xmlFile["@" + variable.@name];
							if (attribList.length() == 1) {
								xmlFile["@" + variable.@name] = variableValue;
							} else {
								childList = xmlFile[variable.@name];
								if (childList.length() == 1) {
									child = childList[0];
									child.appendChild(variableValue);
								} else {
									if (isRoot) {
										xmlFile[variable.@name] = variableValue;
									} else {
										xmlFile["@" + variable.@name] = variableValue;
									}
								}
							}
							
						} else if (variableType == "flash.utils::Dictionary" || variableType == "Object") {
							mainChilds = xmlFile[variable.@name];
							if (mainChilds.length() == 0) {
								xmlFile[variable.@name] = "";
								mainChild = xmlFile[variable.@name][0];
							} else if (mainChilds.length() == 1) {
								mainChild = mainChilds[0];
							} else {
								throw Error(variableType + " tag (" + variable.@name + ") should be used only once.");
							}
							for (itemName in variableValue) {
								attribList = mainChild["@" + itemName];
								if (attribList.length() == 1) {
									mainChild["@" + itemName] = variableValue[itemName];
								} else {
									mainChild[itemName] = variableValue[itemName];
								}
							}
							
						} else {
							
							mainChilds = xmlFile[variable.@name];
							if (mainChilds.length() == 0) {
								xmlFile[variable.@name] = "";
								mainChild = xmlFile[variable.@name][0];
							} else if (mainChilds.length() == 1) {
								mainChild = mainChilds[0];
							} else {
								throw Error(variableType + " tag (" + variable.@name + ") should be used only once.");
							}
							
							parseObject(variableValue, mainChild, false);
							
						}
					}
				}
				
			} else {
				if (dataClass == int || dataClass == uint || dataClass == Number || dataClass == String || dataClass == Boolean) {
					xmlFile.appendChild(data);
				}
			}
		}
	}

}
}

import flash.utils.Dictionary;

/**
 * Object to keep info about missing class arguments.
 */
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

