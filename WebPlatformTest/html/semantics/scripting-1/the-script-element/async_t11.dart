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
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/async_011.htm
 * @assertion
 * http://dev.w3.org/html5/spec/scripting-1.html#prepare-a-script
 * @description An empty parser-inserted script element should return async=true
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
        <script id="scr"></script>
''';

void main() {
  document.body.appendHtml(htmlEL);
  ScriptElement scr=document.getElementById("scr");
  assert_true(scr.async, 
   "An empty parser-inserted script element should return async=true");
}
