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
import "../../../Utils/async_utils.dart";

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

  var selects = document.body.queryAll('select');
  shouldBe(selects[0].namedItem('name1').innerHtml, "2");
  shouldBe(selects[1].namedItem('name1').innerHtml, "1");
  shouldBe(selects[2].namedItem('name1').innerHtml, "1");
  shouldBe(selects[3].namedItem('name1').innerHtml, "1");
  shouldBeNull(selects[4].namedItem('name1'));
}
