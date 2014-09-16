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
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/async_002.htm
 * @assertion
 * http://dev.w3.org/html5/spec/scripting-1.html#dom-script-async
 * @description Changes to the 'async' attribute are reflected in the async property
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
''';

void main() {
  document.body.appendHtml(htmlEL);
  
  test(() {
    ScriptElement s = document.createElement("script");
    s.async = false;
    s.setAttribute('async', ''); /*Should change s.async to true*/
    assert_true(s.async);
  }, "Test 'async' attribute are reflected in the async property with setAttribute");

  test(() {
    ScriptElement s = document.createElement("script");
    s.async = false;
    s.setAttribute('async', ''); /*Should change s.async to true*/
    s.attributes.remove('async'); /*Should change s.async to false*/
    assert_false(s.async);
  }, "Test 'async' attribute are reflected in the async property with attributes.remove");
          
  checkTestFailures();
}
