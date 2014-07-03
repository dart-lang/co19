/**
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/script-text.html
 * @assertion
 * http://whatwg.org/html/#dom-script-text
 * @description HTMLScriptElement.text
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var script;
  
void setup() {
  script = document.createElement("script");
  script.append(new Comment("COMMENT"));
  script.append(new Text("  TEXT  "));
//  script.append(new ProcessingInstruction("P", "I"));
  script.append(document.createElement("a"))
        .append(new Text("ELEMENT"));
}

test(() {
  setup();
  assert_equals(script.text, "  TEXT  ELEMENT");
}, "Getter");

test(() {
  setup();
  script.text = " text ";
  assert_equals(script.text, " text ");
  assert_equals(script.firstChild.nodeType, Node.TEXT_NODE);
  assert_equals(script.firstChild.data, " text ");
  assert_equals(script.firstChild, script.lastChild);
  assert_array_equals(script.childNodes, [script.firstChild]);
}, "Setter (non-empty string)");

test(() {
  setup();
  script.text = "";
  assert_equals(script.text, "");
  assert_equals(script.firstChild, null);
}, "Setter (empty string)");

/* this test is not based on the specification
test(() {
  setup();
  script.text = null;
//  assert_equals(script.text, "null");
  assert_equals(script.text, "");
  assert_equals(script.firstChild.nodeType, Node.TEXT_NODE);
  assert_equals(script.firstChild.data, "null");
  assert_equals(script.firstChild, script.lastChild);
}, "Setter (null)");
*/
  checkTestFailures();

}