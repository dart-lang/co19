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
 * after web-platform-tests/html/semantics/text-level-semantics/the-a-element/a.text-getter-01.html
 * @assertion
 * http://www.whatwg.org/html5/#dom-a-text
 * @description HTMLAnchorElement.text setting
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<a href="a">a b c</a>
<a href="b">a <!--b--> c</a>
<a href="c">a <b>b</b> c</a>
<script>
</script>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  Node d = document.getElementById("test")
                .append(document.createElement("a"));
  (d as AnchorElement).href = "d";
  d.append(new Text("a "));
  d.append(new Text("b "));
  d.append(new Text("c "));
  ElementList<Element> list = document.getElementById("test")
                     .querySelectorAll("a");
  for (var i = 0, il = list.length; i < il; ++i) {
    test(() {
      list[i].text = "x";
      assert_equals(list[i].text, "x");
      assert_equals((list[i].firstChild as Text).data, "x");
      assert_equals(list[i].childNodes.length, 1);
    }, "Test for anchor $i");
  }
  
  checkTestFailures();
}
