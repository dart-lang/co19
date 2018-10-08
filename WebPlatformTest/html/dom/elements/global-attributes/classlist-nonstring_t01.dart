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
 * after web-platform-tests/html/dom/elements/global-attributes/classlist-nonstring.html
 * @assertion 
 * <link rel="help" href="http://www.whatwg.org/html5/#classes">
 * <link rel="help" href="http://www.whatwg.org/html5/#domtokenlist">
 * <link rel="help" href="http://dev.w3.org/2006/webapi/WebIDL/#es-DOMString">
 * <link rel="help" href="http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-262.pdf#page=57">
 * @description classList: non-string contains
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<ul>
<li class=null>
<li class=0>
<li class=NaN>
<li class=Infinity>
<li class=-Infinity>
</ul>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

//var items = document.getElementById("test").getElementsByTagName("li");
var items = document.querySelector('#test').querySelectorAll('li');
var tests = [null, 0, double.nan, double.infinity, -double.infinity];

  for (var i = 0, il = items.length; i < il; ++i) {
    var cls=items[i].classes;
//    print("cls=$cls");
    assert_equals(cls.length, 1);
    assert_equals(cls.first, tests[i].toString(), "i=$i");
  }
  checkTestFailures();
}
