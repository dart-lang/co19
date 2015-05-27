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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/dir.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:dir(ltr), :dir(rtl))
 * @needsreview  Dart issue #19789
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<style id=style>
  #span1 {direction: rtl;}
  #span5, #span6 {display: none;}
</style>
<div id="log"></div>
<bdo dir="rtl" id=bdo1>WERBEH</bdo>
<bdo dir="ltr" id=bdo2>HEBREW</bdo>
<bdi id=bdi1>HEBREW</bdi>
<bdi dir="rtl" id=bdi2>WERBEH</bdi>
<bdi dir="ltr" id=bdi3>HEBREW</bdi>
<span id=span1>WERBEH</span>
<span dir="rtl" id=span2>WERBEH</span>
<span dir="ltr" id=span3>HEBREW</span>
&#x202E;<span id=span4>WERBEH</span>&#x202C;
<span dir="rtl" id=span5>WERBEH</span>
<span dir="ltr" id=span6>HEBREW</span>
<bdo dir="auto" id=bdo3>HEBREW</bdo>
<bdo dir="auto" id=bdo4>إيان</bdo>
<bdo dir="ltr" id=bdo5>עברית</bdo>
''';

void main() {
  document.body.appendHtml(htmlEL);

  testSelector(":dir(rtl)"
    , ["bdo1", "bdi2", "span1", "span2", "span4", "span5", "bdo4"]
    , "':dir(rtl)' matches all elements whose directionality is 'rtl'.");
    
  testSelector(":dir(ltr)"
    , ["html", "head", "body", "meta", "title", "link1", "link2", "script1", "script2", "script3", "stlyle", "log", "bdo2", "bdi3", "span3", "span6", "bdo3", "bdo5"]
    , "':dir(ltr)' matches all elements whose directionality is 'ltr'.");

  var bdo = document.createElement("bdo");
  bdo.setAttribute("dir", "ltr");
  testSelector(":dir(ltr)"
    , ["meta", "title", "link1", "link2", "script1", "script2", "script3", "stlyle", "log", "bdo2", "bdi3", "span3", "span6", "bdo3"]
    , "':dir(ltr)' doesn't match elements not in the document.");
  
  checkTestFailures();
}
