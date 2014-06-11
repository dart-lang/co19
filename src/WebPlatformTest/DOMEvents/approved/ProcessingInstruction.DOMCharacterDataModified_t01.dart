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
   """
   );

   var HELPER = document.getElementById("helper");
    
   asyncStart();
  
   HELPER.onLoad.drain().then((v) {
      assert_true(HELPER.contentWindow.TestResult);
      asyncEnd();
   });
    
   HELPER.src = //  "./support/ProcessingInstruction.DOMCharacterDataModified.xml";
   "$testSuiteRoot/DOMEvents/approved/support/ProcessingInstruction.DOMCharacterDataModified.xml";
}
