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

main() {
  var style = new Element.html('''
      <style>
          @font-face {
              font-family: custom;
              src: url(IntentionallyMissingFile.ttf);
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <!-- content: counter(page) causes the style diff to be "detach" -->
      <div style="font-family: custom; content: counter(page);">
          <br>PASS
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // Must wait for the font to fail to load.
  setTimeout(() { asyncEnd(); }, 100);

  asyncStart();
  document.execCommand("SelectAll", false, '');
}
