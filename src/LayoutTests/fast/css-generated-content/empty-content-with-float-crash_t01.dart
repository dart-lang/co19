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
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
          span::after {content: ''; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=17988">http://bugs.webkit.org/show_bug.cgi?id=17988</a>
          REGRESSION (r31114-31132): Crash in InlineBox::isDirty() opening chowhound.com</i>.
      </p>
      <p>
          No crash means <div>PASS</div>.
      </p>
      <span>
          <div style="float: left;"></div>
      </span>
      ''', treeSanitizer: new NullTreeSanitizer());
}
