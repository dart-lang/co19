/**
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/enabled.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:enabled)
 * @needsreview  Dart issue #19792
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<a id=link3></a>
<area id=link4></area>
<link id=link5></link>
<a href="http://www.w3.org" id=link6></a>
<area href="http://www.w3.org" id=link7></area>
<link href="http://www.w3.org" id=link8></link>
<button id=button1>button1</button>
<button id=button2 disabled>button2</button>
<input id=input1>
<input id=input2 disabled>
<select id=select1>
 <optgroup label="options" id=optgroup1>
  <option value="option1" id=option1 selected>option1
</select>
<select disabled id=select2>
 <optgroup label="options" disabled id=optgroup2>
  <option value="option2" disabled id=option2>option2
</select>
<textarea id=textarea1>textarea1</textarea>
<textarea disabled id=textarea2>textarea2</textarea>
<form>
 <p><input type=submit contextmenu=formmenu id=submitbutton></p>
 <menu type=popup id=formmenu>
  <menuitem command="submitbutton" default id=menuitem1>
  <menuitem command="resetbutton" disabled id=menuitem2>
 </menu>
</form>
<fieldset id=fieldset1></fieldset>
<fieldset disabled id=fieldset2></fieldset>
''';

void main() {
  document.body.appendHtml(htmlEL);

  testSelector(":enabled"
    , ["link6", "link7", "link8", "button1", "input1", "select1", "optgroup1", "option1", "textarea1", "submitbutton", "menuitem1", "fieldset1"]
//,                               '[button1, input1, select1, optgroup1, option1, textarea1, submitbutton, fieldset1]') fails
    , "':enabled' should <a>s/<area>s/<link>s that have an href attribute and elements that are not disabled");
  
  checkTestFailures();
}
