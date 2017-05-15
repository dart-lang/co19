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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/link.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:link)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<a id=link4></a>
<area id=link5></area>
<link id=link6></link>
<a href="http://www.w3.org" id=link7></a>
<area href="http://www.w3.org" id=link8></area>
<link href="http://www.w3.org" id=link9></link>
<a href="http://[" id=link10></a>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  testSelector(":link"
    , ["link7", "link8", "link9", "link10"]
    , "Only <a>s, <area>s and <link>s that have a href attribute match ':link'");

  document.getElementById("link9").attributes.remove("href");
  testSelector(":link"
    , ["link7", "link8", "link10"]
    , "':link' doesn't match elements whos href attribute has been removed");
  
  checkTestFailures();
}
