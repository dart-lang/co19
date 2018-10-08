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
  document.body.setInnerHtml('''
      <table>
          <tbody>
              <td style="counter-increment: list-item"></td>
          </tbody>
          <ol><ol>
          </ol></ol>
          <td>PASS: Reparenting nodes outside of table body does not trigger crash.</td>
          <li></li>
      </table>
      <table>
          <td style="counter-increment: list-item"></td>
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());
}
