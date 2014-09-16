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
 * after web-platform-tests/html/semantics/forms/the-input-element/search_input.html
 * @assertion
 * http://www.w3.org/TR/html5/the-input-element.html#the-input-element
 * @description Search Input
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <h1>Search Input</h1>
        <input type="search" style="display:none" placeholder="Search..." />
''';

void main() {
  document.body.appendHtml(htmlEL);
  InputElement input0=document.getElementsByTagName("input")[0];

  test(() {
    assert_equals(input0.type, "search");}
    , "search type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
    
  test(() {
    assert_equals(input0.placeholder, "Search...");}
    , "placeholder attribute support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-placeholder" });

  checkTestFailures();
}
