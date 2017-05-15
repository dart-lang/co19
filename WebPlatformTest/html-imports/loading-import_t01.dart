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
 * after web-platform-tests/html-imports/loading-import.html
 * @assertion https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/imports/index.html#loading-imports
 * @description  HTML Imports
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

const String resources = '${testSuiteRoot}/html-imports/resources';
const String htmlEL = '''
<link id="linkImport1" rel="import" href="$resources/hello.html">
<link id="linkImport2" rel="import" href="$resources/hello.html">
<link id="linkToTypicalHtml" rel="import" href="$resources/typical.html">
<link id="linkIncludingSubImport" rel="import" href="$resources/sub-parent.html">
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

    test(() {
      var linkImport1 = document.getElementById("linkImport1");
      var linkImport2 = document.getElementById("linkImport2");
      assert_equals(linkImport1.import, linkImport2.import);
      assert_true(linkImport1.import != null, "is null");
    }, 
    "Check on sharing imports. Imports in same location should be represented as same object."
    );
    
    test(() {
      var link = document.getElementById("linkToTypicalHtml");
      assert_equals(link.import.querySelector("p2").parentNode, 
                    link.import.querySelector("parent"));
    }, 
    "Check on HTML Parsing. An HTML parser should be used to parse the import."
    );
    
    test(() {
      var parent = document.getElementById("linkIncludingSubImport");
      var child = parent.import.querySelector("link").imports;
      assert_equals(child.title, "Hello");
    }, 
    "Check on sub-imports. Sub-improts should be loaded as usual imports."
    );

    checkTestFailures();
}
