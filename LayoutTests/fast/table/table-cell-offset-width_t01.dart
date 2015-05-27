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

const String htmlEL2 = r'''
<table>
  <td style="font-family: Ahem; width: 10px">FAIL</td>
</table>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    // crbug.com/290399 reported that offsetWidth on a table cell
    // would incorrectly return the specified width instead of the layout-expanded width.
    // When this would fail, it would be 12px instead of the 66px 'FAIL' expands to in Ahem.
    Element td = document.getElementsByTagName('td')[0];
    Expect.equals(66, td.offsetWidth);
    td.text="PASS";
}
