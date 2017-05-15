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
/*
 * after web-platform-tests/DOMEvents/tests/approved/ProcessingInstruction.DOMCharacterDataModified.html
 *
 * @assertion ProcessingInstruction.data and DOMCharacterDataModified event 
 * @description DOMCharacterDataModified event fires after ProcessingInstruction.data have been modified,
 * but the node itself has not been inserted or deleted. The proximal event target of this
 * event shall be the ProcessingInstruction node.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
   document.body.appendHtml("""
<iframe id="helper" style="display: none"></iframe>
   """, treeSanitizer: NodeTreeSanitizer.trusted);

   var HELPER = document.getElementById("helper");
    
   asyncStart();
  
   HELPER.onLoad.drain().then((v) {
      assert_true(HELPER.contentWindow.TestResult);
      asyncEnd();
   });
    
   HELPER.src = //  "./support/ProcessingInstruction.DOMCharacterDataModified.xml";
   "$testSuiteRoot/DOMEvents/approved/support/ProcessingInstruction.DOMCharacterDataModified.xml";
}
