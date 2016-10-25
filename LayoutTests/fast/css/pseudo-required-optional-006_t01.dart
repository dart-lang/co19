/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description required/optional CSS pseudoclasses part 6
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
       input:optional { background: red; }
       input { background: red; }
       input:required { background: lime; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>All controls should have a green background.</p>
      <input type="text" name="victim" required/>
      <input type="password" name="victim" required/>
      <input type="search" name="victim" required/>
      <input type="url" name="victim" required/>
      <input type="telephone" name="victim" required/>
      <input type="email" name="victim" required/>
      <input type="number" name="victim" required/>
      <input type="checkbox" name="victim" required/>
      <input type="radio" name="victim" required/>
      <input type="file" name="victim" required/>

      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");

  for (var i = 0; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'),
        "rgb(0, 255, 0)");
}
