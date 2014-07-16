/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description No crash means PASS
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
          .capitalize:first-letter {
              text-transform: uppercase;
          }
          .block {
              display: block;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Test case for <a href="https://bugs.webkit.org/show_bug.cgi?id=34641">Bug 34641</a>.
      </p>

      <div class="capitalize"><input class="block" type="submit"></div>
      <div class="capitalize"><select class="block"><option>foo</select></div>
      <div class="capitalize"><input class="block" type="text" value="foo"></div>
      <div class="capitalize"><input class="block" type="checkbox"></div>
      <div class="capitalize"><input class="block" type="radio"></div>
      <div class="capitalize"><input class="block" type="file"></div>
      <div class="capitalize"><textarea class="block"></textarea></div>
      <div class="capitalize"><video class="block" controls></video></div>
      <div class="capitalize"><audio class="block" controls></audio></div>
      <!-- this makes WebKit recalc style -->
      <style></style>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
