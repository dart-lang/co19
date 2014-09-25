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
    <p>There should be a black box below. <br> 

    <table id="table" border="null" width="100%" height="100%">
        <tr>
            <td height="26"></td>
        </tr>
    </table>
    <div id="console"></div>
''';

void main() {
    //document.body.appendHtml(htmlEL2);
        document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Expect.equals("1px", document.querySelector("table").getComputedStyle().borderTopWidth);
}
