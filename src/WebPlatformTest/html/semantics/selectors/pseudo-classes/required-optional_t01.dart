/**
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/required-optional.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:required, :optional)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<input type=text id=text1 value="foobar" required>
<input type=text id=text2 required>
<input type=text id=text3>
<select id=select1 required>
 <optgroup label="options" id=optgroup1>
   <option value="option1" id=option1>option1
</select>
<select id=select2>
 <optgroup label="options" id=optgroup2>
   <option value="option2" id=option2>option2
</select>
<textarea required id=textarea1>textarea1</textarea>
<textarea id=textarea2>textarea2</textarea>
''';

void main() {
  document.body.appendHtml(htmlEL);

  testSelector(":required", ["text1", "text2", "select1", "textarea1"], "':required' matches required <input>s, <select>s and <textarea>s");
  testSelector(":optional", ["text3", "select2", "textarea2"], "':optional' matches elements <input>s, <select>s and <textarea>s that are not required");

  document.getElementById("text1").attributes.remove("required");
  testSelector(":required", ["text2", "select1", "textarea1"], "':required' doesn't match elements whose required attribute has been removed");
  testSelector(":optional", ["text1", "text3", "select2", "textarea2"], "':optional' matches elements whose required attribute has been removed");

  document.getElementById("select2").setAttribute("required", "required");
  testSelector(":required", ["text2", "select1", "select2", "textarea1"], "':required' matches elements whose required attribute has been added");
  testSelector(":optional", ["text1", "text3", "textarea2"], "':optional' doesn't match elements whose required attribute has been added");
  
  checkTestFailures();
}
