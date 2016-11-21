/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for HTMLSelectElement.namedItem()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div style="visibility: hidden">
          <select>
              <option name="name1">1</option>
              <option id="name1">2</option>
          </select>

          <select>
              <option id="name1">1</option>
              <option name="name1">2</option>
          </select>

          <select>
              <option name="name1">1</option>
              <option name="name1">2</option>
          </select>

          <select>
              <option id="name1">1</option>
              <option id="name1">2</option>
          </select>

          <select name="name1">
              <option id="name2">1</option>
              <option id="name3">2</option>
          </select>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  ElementList<Element> selects = document.body.querySelectorAll('select');
  shouldBe((selects[0] as SelectElement).namedItem('name1').innerHtml, "2");
  shouldBe((selects[1] as SelectElement).namedItem('name1').innerHtml, "1");
  shouldBe((selects[2] as SelectElement).namedItem('name1').innerHtml, "1");
  shouldBe((selects[3] as SelectElement).namedItem('name1').innerHtml, "1");
  shouldBeNull((selects[4] as SelectElement).namedItem('name1'));
}
