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
  document.body.setInnerHtml('''
      This tests that select all works on options in a list box.<br>
      <select id="sl" size=5>
      <option id="o1">1
      <option id="o2">2
      <option id="o3">3
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    SelectElement sl = document.getElementById('sl') as SelectElement;
    sl.focus();
    document.execCommand("SelectAll", false, '');
    debug('Test 1');
    OptionElement o1 = document.getElementById('o1');
    OptionElement o2 = document.getElementById('o2');
    OptionElement o3 = document.getElementById('o3');
    shouldBeFalse(o1.selected);
    shouldBeFalse(o2.selected);
    shouldBeFalse(o3.selected);

    sl.multiple = true;
    document.execCommand("SelectAll", false, '');
    shouldBeTrue(o1.selected);
    shouldBeTrue(o2.selected);
    shouldBeTrue(o3.selected);

    sl.multiple = false;
  }

  test();
}
