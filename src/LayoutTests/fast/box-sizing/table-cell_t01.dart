/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that display: table-cell and box-sizing: border-box work
 * when used together.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .styledForTest {
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        background-color: orange;
        color: white;
        border: 7px solid black;
        padding: 5px;
        width: 80px;
        height: 30px;
        margin: 2px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description">All of the boxes should be 80x30 and look identical.</p>
      <div id="console"></div>

      <div id="expected" class="styledForTest"></div>

      <div id="div-display-table-cell" class="styledForTest" style="display: table-cell;"></div>

      <table>
      <tr>
      <td id="td" class="styledForTest"></td>
      </tr>
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());

  ['div-display-table-cell', 'td'].forEach((id) {
    debug(id);
    var element = document.querySelector('#' + id);
    shouldBe(element.offsetWidth, 80);
    shouldBe(element.offsetHeight, 30);
  });
}
