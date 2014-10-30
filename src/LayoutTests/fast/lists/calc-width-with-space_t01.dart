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

const String htmlEL1 = r'''
<style>
     ol { margin: 0px; }
</style>
''';

const String htmlEL2 = r'''
These two lines should look same as spaces after a list marker should
be ignored. There are 18 characters in each line. As they are 20px
width, the total width should be 360px + a few pixels for table.
If the space character after the list marker in "test" isn't ignored,
the number of characters become 19 and 370px div will be overflowed.
Note that this test requires Ahem font.

<div style="height: 20px; overflow-y: scroll;" id="ref">
<table style="width: 370px; font: 20px Ahem;">
 <tr>
  <td><ol><li>XpX XpX</ol></td>
  <td><ol><li>XpX XpX</ol></td>
 </tr>
</table>
</div>

<div style="height: 20px; overflow-y: scroll;" id="test">
<table style="width: 370px; font: 20px Ahem;">
 <tr>
  <td><ol><li> XpX XpX</ol></td>
  <td><ol><li>XpX XpX</ol></td>
 </tr>
</table>
</div>

<div id="result">
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    // Check if the two divs aren't overflowed by checking they have
    // the same height.
    var ref = document.getElementById("ref");
    var test = document.getElementById("test");
    var result = document.getElementById("result");
    Expect.equals(ref.scrollHeight, test.scrollHeight);
}