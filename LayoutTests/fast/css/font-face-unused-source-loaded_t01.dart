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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          @font-face {
              font-family: url-only;
              src: url($root/../../resources/Ahem.ttf);
          }

          @font-face {
              font-family: local-and-url;
              src: local(Arial), url($root/../../resources/Ahem.ttf);
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=32257">https://bugs.webkit.org/show_bug.cgi?id=32257</a>
          Safari/Chromium crashes on complicated @font-face rule</i>.
      </p>
      <p>
          The test passes if it does not crash.
      </p>
      <div style="font-family: url-only">
          Ahem
      </div>
      <div style="font-family: local-and-url">
          Arial
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // Force layout now to kick off font loading before the load even fires.
  document.body.offsetTop;
}
