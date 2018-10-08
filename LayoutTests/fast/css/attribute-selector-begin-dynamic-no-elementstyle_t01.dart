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

main() {
  var style = new Element.html('''
      <style>
          span { display: none }
          *[test^="0"] #sp { color: green; display: block}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div test="1">
      <p>
      Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=60752">https://bugs.webkit.org/show_bug.cgi?id=60752</a>
      </p>
      <p>This test checks whether CSS attribute selector [att^=val] is re-evaluated after attribute changes in DOM elements which have no style associated with them.</p>
      <span id="sp">PASSED</span>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  change() {
    dynamic element = document.getElementsByTagName('div')[0];
    element.attributes['test'] = '0XYZ';
    asyncEnd();
  }

  startTest() {
    // Trigger an attribute change after all load processing is done. Doing the change
    // here immediately does not exhibit the problem.
    setTimeout(change, 0);
  }

  asyncStart();

  startTest();
}
