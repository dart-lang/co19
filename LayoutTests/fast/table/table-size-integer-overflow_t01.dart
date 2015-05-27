/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL2 = r'''
<div style="float: left;">
  <table style="margin: 1px">
    <tr>
      <td></td>
      <td id="cell" style="background-color: green; width: 100%; height: 30px">
        <span>FAIL</span>
      </td>
    </tr>
  </table>
</div>
<div style="clear: left;">The green box should be the full width of the page.</div>
''';

void doTest(e) {
  var cell = document.getElementById("cell");
  var text = cell.children.first;
  var computedStyle=cell.getComputedStyle();
  String paddingRightS=computedStyle.getPropertyValue('padding-right');
  int paddingRight=int.parse(paddingRightS.substring(0, paddingRightS.length-2)); // cut "suffix "px"
  String paddingLeftS=computedStyle.getPropertyValue('padding-right');
  int paddingLeft=int.parse(paddingLeftS.substring(0, paddingLeftS.length-2)); // cut "suffix "px"
  var wdiff = cell.offsetWidth - text.offsetWidth - (paddingRight + paddingLeft);
//  print("${cell.offsetWidth} - ${text.offsetWidth} - ($paddingRight + $paddingLeft)");
  Expect.isTrue(wdiff>0);
  text.text = "PASS";
}

void main() {
//    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
//    document.body.setInnerHtml(htmlEL2);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(doTest);
}
