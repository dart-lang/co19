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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       input:read-only { background:red }
       input { display: none }
       select:read-only { background:red }
       select { display: none }
       button:read-only { background:red }
       button { display: none }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>:read-only doesn't apply to following controls. Fails if FAILURE is shown somewhere.</p>
      <input name="victim" type="radio" readonly>
      <input name="victim" type="file" readonly>
      <input name="victim" type="range" readonly disabled>
      <input name="victim" type="button" readonly>
      <input name="victim" type="submit" readonly>
      <input name="victim" type="reset" readonly>
      <select name="victim" readonly></select>
      <button name="victim" readonly></button>
      <button name="victim" readonly type="reset"></button>
      <button name="victim" readonly type="submit"></button>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  var i = document.getElementsByName("victim");
  for (var c = 0; c < i.length; c++) {
    shouldBe(getComputedStyle(i[c], null).getPropertyValue('display'), "none");
  }
}
