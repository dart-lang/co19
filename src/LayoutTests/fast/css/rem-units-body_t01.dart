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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
              html {
                      font-size: 20px;
              }

              body {
                      font-size: 2rem;
              }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This should be 40px tall.
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.body).fontSize, "40px");
}
