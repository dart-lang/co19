/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that OPTION inherits the modified OPTGROUP color.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <select id="s">
          <optgroup id="g" style="color:red">
              <option id="o">Green</option>
          </optgroup>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop; // force style recalc.
  document.getElementById("g").style.color = "green";
  shouldBe(getComputedStyle(document.getElementById('o'), null).color, 'rgb(0, 128, 0)');
}
