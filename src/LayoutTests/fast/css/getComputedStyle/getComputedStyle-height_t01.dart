/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the computed height of a cell :
 * https://bugs.webkit.org/show_bug.cgi?id=33593
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
          table td {
              padding: 20px;
              border: 10px solid blue;
          }

          #cell1 {
              height: 200px;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <table border="0" cellspacing="0" cellpadding="0" id="table">
          <tr id="row1">
              <td id="cell1">height</td>
          </tr>
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById('cell1');
  var table = document.getElementById('table');
  var computedStyle = getComputedStyle(e, null);

  shouldBe(computedStyle.getPropertyValue('height'), '200px');
}
