package mindscriptact.utils.xml {
import flash.utils.describeType;
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class XmlHelper {
	
	static public function fillObjectWithXml(fillClass:Class, xmlFile:XML):Object {
		var retval:Object = new fillClass();
		xmlToObject(retval, xmlFile);
		return retval;
	}
	
	static public function xmlToObject(fillObject:Object, xmlFile:XML):void {
		var subList:XMLList;
		
		var classDescription:XML = describeType(fillObject.constructor);
		
		var variableList:XMLList = classDescription.factory.*.(name() == "variable" || name() == "accessor");
		
		for (var i:int = 0; i < variableList.length(); i++) {
			
			var variableType:String = variableList[i].@type;
			
			// check if its vertor
			if (variableType.indexOf("__AS3__.vec::Vector") != -1) {
				
				//create vector if it is null.
				if (fillObject[variableList[i].@name] == null) {
					var vectClass:Class = getDefinitionByName(variableType) as Class;
					fillObject[variableList[i].@name] = new vectClass();
				}
				
				// get vector type.
				var childSplitArr:Array = variableType.split("<");
				var childType:String = childSplitArr[childSplitArr.length - 1].split(">")[0];
				var clildClass:Class = getDefinitionByName(childType) as Class;
				
				// get elements with same name as vector var name.
				var vectorHolderList:XMLList = xmlFile[variableList[i].@name];
				
				// if element is single, without arguments, and with children - treat it as main node, and treat childs as items.
				if (vectorHolderList.length() == 1) {
					var vectorItimList:XMLList = vectorHolderList[0].children();
					for (var j:int = 0; j < vectorItimList.length(); j++) {
						var childObject:Object = new clildClass();
						
						xmlToObject(childObject, vectorItimList[j]);
						fillObject[variableList[i].@name].push(childObject);
					}
				} else if (vectorHolderList.length() > 1) { // treat every child as item of vector.
					 //treat nodes AS object elements.
					for (var k:int = 0; k < vectorHolderList.length(); k++) {
						childObject = new clildClass();
						xmlToObject(childObject, vectorHolderList[k])
						fillObject[variableList[i].@name].push(childObject);
					}
				}
			} else {
				//trace("variableType : " + variableType);
				var memberValue:Object;
				switch (variableType) {
					case "Boolean": 
						memberValue = false;
						var booleanVar:String = String(xmlFile["@" + variableList[i].@name]);
						if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
							memberValue = true;
						} else {
							subList = xmlFile[variableList[i].@name];
							if (subList.length() == 1) {
								booleanVar = (subList[0] as XML).toString()
								if (booleanVar == "true" || booleanVar == "TRUE" || booleanVar == "1") {
									memberValue = true;
								}
							}
						}
						break;
					case "int": 
						memberValue = int(xmlFile["@" + variableList[i].@name]);
						if (memberValue == 0) {
							subList = xmlFile[variableList[i].@name];
							if (subList.length() == 1) {
								memberValue = int((subList[0] as XML).toString());
							}
						}
						break;
					case "uint": 
						memberValue = uint(xmlFile["@" + variableList[i].@name]);
						if (memberValue == 0) {
							subList = xmlFile[variableList[i].@name];
							if (subList.length() == 1) {
								memberValue = uint((subList[0] as XML).toString());
							}
						}
						break;
					case "Number": 
						memberValue = Number(xmlFile["@" + variableList[i].@name]);
						if (memberValue == 0) {
							subList = xmlFile[variableList[i].@name];
							if (subList.length() == 1) {
								memberValue = Number((subList[0] as XML).toString());
							}
						}
						break;
					case "String": 
						memberValue = String(xmlFile["@" + variableList[i].@name]);
						if (memberValue == "") {
							subList = xmlFile[variableList[i].@name];
							if (subList.length() == 1) {
								memberValue = (subList[0] as XML).toString();
							}
						}
						break;
					case "flash.utils::Dictionary": 
						// init dictionary
						var dictObj:Dictionary = fillObject[variableList[i].@name] as Dictionary;
						if (dictObj == null) {
							dictObj = new Dictionary();
						}
						// get dictionary tag
						var dictList:XMLList = xmlFile[variableList[i].@name];
						
						var dictTagCount:int = dictList.length();
						if (dictTagCount == 1) {
							var dictXml:XML = dictList[0];
							// get all attributes
							var dictXmlAttribs:XMLList = dictXml.attributes();
							var attribCount:int = dictXmlAttribs.length();
							for (var l:int = 0; l < attribCount; l++) {
								var attribXml:XML = dictXmlAttribs[l];
								if (!attribXml.hasComplexContent()) {
									dictObj[String(attribXml.localName())] = attribXml.toString();
								}
							}
							// get all sub Tags. (use simple tags)
							var subTags:XMLList = dictXml.children();
							var childCount:int = subTags.length();
							for (var m:int = 0; m < childCount; m++) {
								var childXml:XML = subTags[m];
								if (!childXml.hasComplexContent()) {
									dictObj[String(childXml.localName())] = childXml.toString();
								}
							}
						} else if (dictTagCount == 0) {
							// 
						} else if (dictTagCount > 1) {
							throw Error("You have more then one tag for dictionary with var name:" + variableList[i].@name + " Please use only one.");
						}
						
						memberValue = dictObj;
						
						break;
					//default: 
					//var objectClass:Class = getDefinitionByName(variableType) as Class;
					//if (objectClass) {
					//memberValue = new objectClass();
					//var objectNodes:XMLList = xmlFile[variableList[i].@name];
					//if (objectNodes.length() > 0) {
					//xmlToObject(memberValue, objectNodes[0]);
					//}
					//} else {
					//throw Error("cant handle this type: " + variableType);
					//}
				}
				fillObject[variableList[i].@name] = memberValue;
			}
		}
	}
}
}
