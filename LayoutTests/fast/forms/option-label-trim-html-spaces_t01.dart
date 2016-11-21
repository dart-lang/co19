/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for space striping .label attribute of OPTION element
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <select>
      <option id="o1">  text   with   extra   while   spaces  </option>
      <option id="o2">  text  </option>
      <option id="o3">&nbsp;test&nbsp;text&nbsp;</option>
      <option id="o4">   test&nbsp;&nbsp;text   </option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  OptionElement o1 = document.getElementById('o1') as OptionElement;
  shouldBe(o1.label, "text with extra while spaces");

  OptionElement o2 = document.getElementById('o2') as OptionElement;
  shouldBe(o2.label, "text");

  OptionElement o3 = document.getElementById('o3') as OptionElement;
  var expected = '\u00A0'+'test'+'\u00A0'+ 'text'+'\u00A0';
  shouldBe(o3.label, expected);

  OptionElement o4 = document.getElementById('o4') as OptionElement;
  expected = 'test'+'\u00A0\u00A0'+ 'text';
  shouldBe(o4.label, expected);
}
