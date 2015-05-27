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
  document.body.setInnerHtml('''
      <style>
          div:before
          {
              content: url($root/resources/greenbox.png);
              display: block;
              overflow: hidden;
              width: 100;
              height: 100;
          }
      </style>
      Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=61411">61411</a>: ASSERTION FAILED: !m_layoutRoot->container() || !m_layoutRoot->container()->needsLayout() with generated content<br>
      Test passes if it does not crash.
      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
}
