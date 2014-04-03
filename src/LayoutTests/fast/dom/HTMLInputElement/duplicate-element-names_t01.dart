/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Multiple radio buttons/checkboxes with the same name should
 * map to a countable collection object when accessed through either
 * document.form.name or document.getElementsbyName().
 * There is no standardization for what that object is called 
 * (Collection, NodeList, HTMLCollection, etc.), nor is it always the same 
 * for both methods of access.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form name="f">
      <ul>
        <li>Radio button:
          <input type="radio" name="rb2"/>Male
          <input type="radio" name="rb2"/>Female
        </li>

        <li>Checkbox:
          <input type="checkbox" name="cb1"/>1
        </li>

        <li>Checkbox:
          <input type="checkbox" name="cb2"/>1
          <input type="checkbox" name="cb2"/>2
        </li>
      </ul>
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementsByName('cb0').length, 0);
  shouldBe(document.getElementsByName('cb1')[0].nodeName, 'INPUT');
  shouldBe(document.getElementsByName('cb2').length, 2);
  shouldBe(document.getElementsByName('rb2').length, 2);
}
