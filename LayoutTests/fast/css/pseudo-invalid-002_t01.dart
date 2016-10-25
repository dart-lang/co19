/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test performs a check for the :invalid CSS selector on a
 * required textarea element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var styles = new DocumentFragment.html('''
      <style>
       :invalid { background: lime; }
       :valid { background: red; }
       textarea { background: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(styles);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get">
      <textarea name="victim" required></textarea>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");
  for (var i = 0; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'),
        'rgb(0, 255, 0)');
}
