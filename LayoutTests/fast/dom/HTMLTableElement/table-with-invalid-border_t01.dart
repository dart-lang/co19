/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description https://bugs.webkit.org/show_bug.cgi?id=102112: There should
 * be a black box below.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <table border="djska" width="100%" height="100%">
        <tr>
            <td height="26"></td>
        </tr>
    </table>
    ''', treeSanitizer: new NullTreeSanitizer());

  var table = document.body.querySelector('table');
  shouldBeEqualToString(table.getComputedStyle().borderTopWidth, "1px");
}
