/**
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/indeterminate.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:indeterminate)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<input type=checkbox id=checkbox1>
<input type=checkbox id=checkbox2>
<input type=radio id=radio1 checked>
<input type=radio name=radiogroup id=radio2>
<input type=radio name=radiogroup id=radio3>
<input type=radio name=group2 id=radio4>
<input type=radio name=group2 id=radio5>
<progress id="progress1"></progress>
<progress id="progress2" value=10></progress>
''';

void main() {
  document.body.appendHtml(htmlEL);

  testSelector(":indeterminate"
    , ["radio2", "radio3", "radio4", "radio5", "progress1"]
    , "':progress' matches <input>s radio buttons whose radio button group contains no checked input and <progress> elements without value attribute");

  document.getElementById("radio2").setAttribute("checked", "checked");
  testSelector(":indeterminate"
    , ["radio4", "radio5", "progress1"]
    , "dynamically check a radio input in a radio button group");

  document.getElementById("radio4").click();
  testSelector(":indeterminate"
    , ["checkbox1", "progress2"]
    , "click on radio4 which is in the indeterminate state");

  document.getElementById("progress1").setAttribute("value", "20");
  testSelector(":indeterminate"
    , []
    , "adding a value to progress1 should put it in a determinate state");

  document.getElementById("progress2").attributes.remove("value");
  testSelector(":indeterminate"
    , ["progress2"]
    , "removing progress2's value should put it in an indeterminate state");

  InputElement checkbox1=document.getElementById("checkbox1");
  checkbox1.indeterminate = true; // set checkbox1 in the indeterminate state
  testSelector(":indeterminate"
    , ["checkbox1", "progress2"]
    , "':progress' also matches <input> checkbox whose indeterminate IDL is set to true");
  
  checkTestFailures();
}
