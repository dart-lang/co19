/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      td {
          counter-increment: list-item;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <table>
          <tbody>
              <td>
          </tbody>
          <ol>re-parent me</ol>
          <ol>re-parent me</ol>
              </td>
          <td></td>
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());

  crash(_) {
    document.body.innerHtml = "PASS: Malformed table counters do not cause crash";
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(crash);
}
