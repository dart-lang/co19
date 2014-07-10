/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it doesn't ASSERT.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var index = document.styleSheets.length; // test framework may have ones

  var style = new Element.html('''
      <style>
      .absent {
          background: #fff url(foo.png) no-repeat left 4px;
      }

      body {
          background: #fff;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      ''', treeSanitizer: new NullTreeSanitizer());

  document.styleSheets[index].rules[1].style.background;
}
