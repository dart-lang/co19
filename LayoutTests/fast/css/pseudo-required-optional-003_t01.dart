/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description required/optional CSS pseudoclasses part 3
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
       input:required { background: lime; }
       textarea:required { background: lime; }
       input { background: red; }
       textarea { background: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>All controls should have a green background.</p>
      <input name="victim" required />
      <textarea name="victim" required disabled/></textarea>
      <textarea name="victim" required readonly/></textarea>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");

  for (var i = 0; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'), "rgb(0, 255, 0)");
}
