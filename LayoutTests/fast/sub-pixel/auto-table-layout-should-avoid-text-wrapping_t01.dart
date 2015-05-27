/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that we don't incorrectly wrap an auto-layout
 * table due to improper truncation of sub-pixel accumulation. See Bug 93911.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
body {
  font-size: 11px;
  font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
  line-height: 20px;
}
td {
  padding: 0 0 0 0;
}
</style>
''';

const String htmlEL2 = r'''
<table id="testTable">
  <tbody>
    <tr>
      <td id="testCell">English (US)</td>
    </tr>
  </tbody>
</table>
<p id="description"></p>
<div id="console"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var lineHeight = document.getElementById('testCell').style.lineHeight;
    Element testCell=document.getElementById('testCell');
    Expect.equals(testCell.getComputedStyle().lineHeight,
        "${testCell.offsetHeight}px"
    );
}
