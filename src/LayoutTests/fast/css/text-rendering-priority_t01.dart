/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description No crash means test passed.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
        <style>
            #target { font: 20px fantasy; }
            #target { font-family: sans-serif; }
            #target { font-size: 40px; }
            #target { font-style: italic; }
            #target { font-variant: small-caps; }
            #target { font-weight: 900; }
            #target { text-rendering: optimizelegibility; }
            #target { -webkit-font-smoothing: none; }
            #target { zoom: 2; }
        </style>
        ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=41585">https://bugs.webkit.org/show_bug.cgi?id=41585</a>
          Reproducible crash with Optimize Legibility extension</i>.
      </p>
      <p>
          No crash means test passed.
      </p>
      <div id="target" style="text-indent: 2ex;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
