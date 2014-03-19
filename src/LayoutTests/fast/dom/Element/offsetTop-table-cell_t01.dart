/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>This is a regression test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=8085">https://bugs.webkit.org/show_bug.cgi?id=8085</a> Main menu positioned incorrectly on eia.org and fedex.com/us</i> and for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=19094">https://bugs.webkit.org/show_bug.cgi?id=19094</a> offsetTop is wrong in cell &lt;td&gt;.</i>
    </p>
    <pre id="console"></pre>
    <table cellspacing="0" cellpadding="0">
    <tr id="row1" style="height: 50px;"><td colspan="2"></td></tr>
    <tr id="row2"><td id="cell1" style="height: 100px;"></td><td id="cell2" style="height: 20px;"><div></div></td></tr>
    </table>

   <table cellspacing="0" cellpadding="0" width="20px" border="1" align="center">
    <tr id='tr1' align="center">
        <td id='td1'>x</td>
        <td id='td2'>
            <div>This</div>is more text.
        <td id='td3'>
            And a lot more text that should have the smallest offsetTop.
        </td>
    </tr>
    </table>

<table cellspacing="0" cellpadding="0" style="background-color: orange;"><tr style="background-color:
blue;"><td id="td4" style="width: 100px; height:
500px;background-color: red"></td></tr></table>

    <table cellspacing="0" cellpadding="0"><tbody><tr>
        <td style="height: 100px;">
            <div style="margin: 50px 0px;"></div>
        </td>
        <td>
            <div id='div5'>
        </td>
    </tr></tbody></table>
    ''', treeSanitizer: new NullTreeSanitizer());

  var console = document.getElementById("console");
  var rowOffset = document.getElementById("row2").offsetTop;
  var cellOffset = document.getElementById("cell2").offsetTop;
  console.text += "Table 1 row 2 top offset:" + rowOffset.toString();
  console.text += "\n";
  console.text += "Table 1 cell 2 top offset:" + cellOffset.toString();
  console.text += "\n";
  var tr1Offset = document.getElementById("tr1").offsetTop;
  var td1Offset = document.getElementById("td1").offsetTop;
  var td2Offset = document.getElementById("td2").offsetTop;
  var td3Offset = document.getElementById("td3").offsetTop;
  var td4Offset = document.getElementById("td4").offsetTop;
  console.text += "Table 2 row 1 top offset:" + tr1Offset.toString();
  console.text += "\n";
  console.text += "Table 2 cell 1 top offset:" + td1Offset.toString();
  console.text += "\n";
  console.text += "Table 2 cell 2 top offset:" + td2Offset.toString();
  console.text += "\n";
  console.text += "Table 2 cell 3 top offset:" + td3Offset.toString();
  console.text += "\n";
  console.text += "Table 3 cell 1 top offset:" + td4Offset.toString();
  console.text += "\n";
  var div5Offset = document.getElementById("div5").offsetTop;
  console.text += "Table 4 div 1 top offset:" + div5Offset.toString();
  console.text += "\n";
  console.text += "Test result: ";
  var check = rowOffset == 50 && cellOffset == 50 && tr1Offset == 0 
      && tr1Offset == td2Offset && tr1Offset == td3Offset && td4Offset == 0
      && div5Offset == 50;
  console.text += (check ? "PASS" : "FAIL");
  //Expect.isTrue(check);
  Expect.equals(50, rowOffset, "rowOffset");
  Expect.equals(50, cellOffset, "cellOffset");
  Expect.equals(0, tr1Offset, "tr1Offset");
  Expect.equals(0, td2Offset, "td2Offset");
  Expect.equals(0, td3Offset, "td3Offset");
  Expect.equals(0, td4Offset, "td4Offset");
  Expect.equals(50, div5Offset, "div5Offset");
}
