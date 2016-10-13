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
 * after web-platform-tests/html/syntax/parsing/Document.getElementsByTagName-foreign-02.html
 * @assertion
 * <link rel="help" href="https://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementsbytagname">
 * <link rel="help" href="http://www.whatwg.org/html/#parsing">
 * @description getElementsByTagName and font 
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<font></font>
<svg><font/></svg>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL);
  
    var HTML = "http://www.w3.org/1999/xhtml", SVG = "http://www.w3.org/2000/svg";
    test(() {
      var fonts=document.getElementsByTagName("FONT");
      assert_equals(fonts.length, 1);
      dynamic font0=fonts[0];
      assert_equals(font0.namespaceUri, HTML);
    }, "Upper-case font");
    
    test(() {
      var fonts=document.getElementsByTagName("font");
      assert_equals(fonts.length, 2);
      dynamic font0=fonts[0];
      assert_equals(font0.namespaceUri, HTML);
      dynamic font1=fonts[1];
      assert_equals(font1.namespaceUri, SVG);
    }, "Lower-case font");

    checkTestFailures();
}
