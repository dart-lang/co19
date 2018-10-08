/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          div.example:before {
              content: counter(exampleno, upper-roman);
              counter-increment: exampleno;
          }
          pre.example:before {
              content: counter(exampleno, upper-roman);
              counter-increment: exampleno;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This tests that we don't crash when using the CSS counters feature.
      <div class="example"></div>
      <pre class="example"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) => asyncEnd());
}
