/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for http://webkit.org/b/73520 WebKit bug 73520.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
          font-family: invalid-data;
          src:url("data:font/ttf;base64,VGhpcyBpcyBub3QgYSBmb250LiAgVGhpcyBpcyBub3QgYSBmb250LiAgVGhpcyBpcyBub3QgYSBmb250LiAgVGhpcyBpcyBub3QgYSBmb250LiAgVGhpcyBpcyBub3QgYSBmb250Lgo=");
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <p>Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=85089">85089: [Qt] ASSERT in FontCustomPlatformDataQt.cpp with invalid font in data URI</p>
      <span style="font-family:invalid-data;">This tests for an ASSERT when using @font-face with invalid font data</span>
      ''', treeSanitizer: new NullTreeSanitizer());
}
