/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description If the test passes it won't crash
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=8469">http://bugs.webkit.org/show_bug.cgi?id=8469</a> CRASH: WebCore::CSSParser::parseDashboardRegions when attr() is passed</i>.</p>
      <p>If the test passes it won't crash</p> 
      <br style="-webkit-dashboard-region: dashboard-region("a");">
      <table style="-webkit-dashboard-region: attr("a");">
      ''', treeSanitizer: new NullTreeSanitizer());
}
