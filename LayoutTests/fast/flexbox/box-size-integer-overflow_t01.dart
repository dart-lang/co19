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
      <div style="float: left;">
        <div style="display: -webkit-box; border: 1px solid">
          <table>
            <tr>
              <td></td>
              <td id="cell" style="background-color: green; width: 100%; height: 30px">
                <span>FAIL</span>
              </td>
            </tr>
          </table>
        </div>
      </div>
      <div style="clear: left;">The green box should be the full width of the page.</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  parseInt(str) => int.parse(str.substring(0, str.length-2)); // trim trailing 'px'

  var cell = document.getElementById("cell");
  var text = firstElementChild(cell);
  var wdiff = cell.offsetWidth - text.offsetWidth - (parseInt(getComputedStyle(cell).getPropertyValue('padding-right')) +
                                                     parseInt(getComputedStyle(cell).getPropertyValue('padding-left')));
  if (wdiff > 0)
    text.text = "PASS";
}
