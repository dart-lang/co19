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
  var style = new Element.html('''
      <style>
        body :after {
          content: ".";
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test should load without crashing. It checks that generated
      content in tables is initialized properly.</p>
      <table style="border-collapse: collapse;">
        <tr>
          <td><input type="text"></td>
          <td><input type="submit"></td>
        </tr>
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());
}
