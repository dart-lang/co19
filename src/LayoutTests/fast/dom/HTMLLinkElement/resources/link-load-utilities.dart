import "dart:html";
import "../../../../../Utils/expect.dart";

shouldComputedColorOfElementBeEqualToRGBString(element, expectedColor)
{
  var elementName;
  if (element.id != '')
    elementName = '#${element.id}';
  else
    elementName = '#${element.tagName}';
  
  var actualColor = element.getComputedStyle().color;

  Expect.equals(expectedColor, actualColor, elementName);
}

createLinkElementWithStylesheet(stylesheetURL)
{
  var link = document.createElement("link");
  link.rel = "stylesheet";
  link.href = stylesheetURL;
  return link;
}

createStyleElementWithString(stylesheetData)
{
  var style = document.createElement("style");
  style.text = stylesheetData;
  return style;
}
