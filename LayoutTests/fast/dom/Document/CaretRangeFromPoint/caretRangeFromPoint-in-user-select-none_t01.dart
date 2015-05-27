/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    Before <span id="sample" style="font-family: monospace; -webkit-user-select:none">Test</span> After
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  var range = document.caretRangeFromPoint(
      ($('sample').offsetLeft + $('sample').offsetWidth / 2).round(),
      $('sample').offsetTop + 3);
  Expect.equals($("sample").firstChild, range.startContainer);
  Expect.equals(2, range.startOffset);
  Expect.isTrue(range.collapsed);
}
