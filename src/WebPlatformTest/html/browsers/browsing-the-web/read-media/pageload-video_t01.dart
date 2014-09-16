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
 * after web-platform-tests/html/browsers/browsing-the-web/read-media/pageload-video.html
 * @assertion Only child of body must be an HTML element
 * @description The document for a standalone media file should have one child in the body.
 * @issue #18657
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "../../../../testcommon.dart";

const String htmlEL='''
  <iframe id="testframe"
   src="data:video/webm">
  </iframe>
''';
         
void main() {
  Element testframe = new Element.html(htmlEL, treeSanitizer: new NullTreeSanitizer());
  document.body.append(testframe);
 
  void check(e) {
    var testframeChildren = testframe.contentDocument.body.childNodes;
    assert_equals(testframeChildren.length, 1, "Body of image document has 1 child");
    assert_equals(testframeChildren[0].nodeName, "VIDEO", "Only child of body must be an <video> element");
    assert_equals(testframeChildren[0].namespaceURI, "http://www.w3.org/1999/xhtml",
                  "Only child of body must be an HTML element");
    asyncEnd();
  }

  asyncStart();
//  testframe.onLoad.drain().then(check);
  testframe.onLoad.listen(check);
  
}
