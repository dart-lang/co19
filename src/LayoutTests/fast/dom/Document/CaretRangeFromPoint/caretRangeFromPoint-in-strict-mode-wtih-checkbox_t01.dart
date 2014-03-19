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
    <div id="container"><input type=checkbox></div>''',
    treeSanitizer: new NullTreeSanitizer());

  var result = document.caretRangeFromPoint(40, 20);
  Expect.equals('DIV', result.startContainer.tagName);
  Expect.equals(1, result.startOffset);
  Expect.equals(result.endContainer, result.startContainer);
  Expect.equals(result.endOffset, result.startOffset);
}
