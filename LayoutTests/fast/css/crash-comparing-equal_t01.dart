/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This page shouldn't crash when parsing CSS - Bug 95706.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
          #parent {
              font: 20px/1 ahem;
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
}
