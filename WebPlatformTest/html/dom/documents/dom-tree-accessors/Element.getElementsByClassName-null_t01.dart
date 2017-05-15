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
 * after web-platform-tests/html/dom/documents/Element.getElementsByClassName-null-undef.html
 * @assertion http://www.whatwg.org/html5/#dom-getelementsbyclassname
 * @description getElementsByClassName and null
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<p id="p1"></p>
<p class="undefined" id="p2"></p>
<p class="null" id="p3"></p>
<p class="undefined null" id="p4"></p>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var wrapper = document.getElementById("test");
  var nullClass=wrapper.getElementsByClassName("null");
  assert_equals(nullClass.length, 2);
  assert_equals(nullClass[0], document.getElementById("p3"));
  assert_equals(nullClass[1], document.getElementById("p4"));
}
