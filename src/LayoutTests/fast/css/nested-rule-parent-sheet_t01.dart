/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description The parent sheet of a font face rule inside a media block
 * should be defined
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @media screen {
        @font-face {
          src: local('Courier');
          font-family: Courier;
        }
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  shouldBeTrue(style.sheet.cssRules[0].cssRules[0].parentStyleSheet is CssStyleSheet);
}
