/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
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
