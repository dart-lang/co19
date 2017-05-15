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
 * after web-platform-tests/html-imports/link-import.html
 * @assertion
 * @description  
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

const String resources = '${testSuiteRoot}/html-imports/resources';
const String htmlEL = '''
<link id="linkImport" rel="import" href="$resources/hello.html">
<link id="linkImportBlockingParent" rel="import" href="$resources/another.html" />
''';

LinkElement linkElement(String id) => document.getElementById(id);

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    
    test(() {
//      var import = document.getElementById("linkImport").import;
      var linkImport = linkElement("linkImport");
//      print("linkImport is ${linkImport.runtimeType}");
      var import = linkImport.import;
      assert_true(import is DocumentFragment, "import is ${import.runtimeType}");
      var target=import.querySelector("#target");
      assert_true(target is DocumentFragment, "target is ${target.runtimeType}");
    }, 
    "Check on loaded import. It must return the imported fragment for the import, represented by the link element."
    );
    
    test(() {
      var linkImport = document.getElementById("linkImport");
      assert_equals(linkImport.import, linkImport.import);
    }, 
    "Check on object identity. The same object must be returned each time."
    );
       
    checkTestFailures();
}
