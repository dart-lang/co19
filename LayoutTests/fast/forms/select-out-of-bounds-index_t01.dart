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
  document.body.setInnerHtml('''
      This tests that we don't crash when setting the selectedIndex out of bounds<br>
      <select id="sl">
          <optgroup label="group">
              <option id="op1">1
              <option id="op2">2
          </optgroup>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  var sl = document.getElementById('sl');
  sl.selectedIndex = 1;
  sl.selectedIndex = 2;
  sl.selectedIndex = 0;
  sl.selectedIndex = -1;
  sl.selectedIndex = 0;
  sl.selectedIndex = 5;
}
