/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div style="content:url(//%);"></div>
      <div style="content:url(http://|server|/);"></div>
      An invalid URL in the "content" style property should not cause a crash when the browser navigates away from the page.

      FAIL - The browser should have navigated to resources/pass.html.
      ''', treeSanitizer: new NullTreeSanitizer());

  window.location.href = '$root/resources/pass.html';
}
