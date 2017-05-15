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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/focus.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:focus)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<div id=body tabindex=0>
  <button id=button1 type=submit>button1</button>
  <input id=input1>
  <input id=input2 disabled>
  <input id=input3 autofocus>
  <textarea id=textarea1>textarea1</textarea>
  <input type=checkbox id=checkbox1 checked>
  <input type=radio id=radio1 checked>
  <div tabindex=0 id=div1>hello</div>
  <div contenteditable id=div2>content</div>
  </div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

    document.getElementById("input1").focus(); // set the focus on input1
    testSelector(":focus", ["input1"], "input1 has the focus");

    document.getElementById("div1").focus();
    testSelector(":focus", ["div1"], "tabindex attribute makes the element focusable");

    document.getElementById("div2").focus();
    testSelector(":focus", ["div2"], "editable elements are focusable");

  checkTestFailures();
}

