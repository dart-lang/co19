/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it does not crash.
 * Bug: href="https://bugs.webkit.org/show_bug.cgi?id=54478
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <spacer style='counter-increment: a'>
      <spacer>
      <f id='f'>
      </spacer>
      <c>
        <spacer style='counter-increment: a'>
      </c>
      <spacer style='counter-increment: a'>
      <div id='p' style='counter-reset: a'>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('f').append(document.getElementById("p"));
}
