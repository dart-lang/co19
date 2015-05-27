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
      <p>This test checks that the selected property of an option is initialized correctly. https://bugs.webkit.org/show_bug.cgi?id=32641</p>
      <p>Before querying selectedIndex, [theOption].selected = <span id="logOne"></span></p>
      <p>[theSelect].selectedIndex = <span id="logTwo"></span></p>
      <p>After querying selectedIndex, [theOption].selected = <span id="logThree"></span></p>
      <select id="theSelect" style="display:none">
        <option id="theOption">lalala</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  var o = document.getElementById('theOption');
  document.getElementById('logOne').text = o.selected.toString();
  shouldBe(o.selected, true);

  SelectElement s = document.getElementById('theSelect');
  document.getElementById('logTwo').text = s.selectedIndex.toString();
  shouldBe(s.selectedIndex, 0);

  document.getElementById('logThree').text = o.selected.toString();
  shouldBe(o.selected, true);
}

