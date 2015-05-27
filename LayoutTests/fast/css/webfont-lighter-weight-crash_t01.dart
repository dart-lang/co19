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
              @font-face {
                      font-weight: lighter;
                      font-family: "Times New Roman"; 
                      src: local("Helvetica"); 
              }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
              Tests that <code>font-weight: lighter</code> is handled for
              web fonts. Test passes if it does not crash.
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());
}
