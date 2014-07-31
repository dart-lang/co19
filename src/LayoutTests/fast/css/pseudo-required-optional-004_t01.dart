/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description required/optional CSS pseudoclasses part 4
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       button:optional { background: lime; }
       input:optional { background: lime; }
       select:optional { background: lime; }
       textarea:optional { background: lime; }
       button { background: red; }
       input { background: red; }
       select { background: red; }
       textarea { background: red; }
       button:required { background: red; }
       input:required { background: red; }
       select:required { background: red; }
       textarea:required { background: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>All controls should have a green background.</p>
      <button type="button" name="victim">Lorem ipsum</button>
      <input name="victim" disabled/>
      <input type="button" name="victim"/>
      <select name="victim"></select>
      <textarea name="victim"></textarea>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");

  for (var i = 0; i < v.length; i++)
    shouldBe(getComputedStyle(v[i], null).getPropertyValue('background-color'), "rgb(0, 255, 0)");
}
