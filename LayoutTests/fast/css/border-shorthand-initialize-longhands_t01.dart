/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures border shorthand property initializes
 * longhand properties such as border-top-style and border-right-color.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var div = document.createElement('div');
  div.setAttribute('style', 'border: 1px');
  shouldBe(div.style.borderTopStyle, 'initial');
  shouldBe(div.style.borderTopStyle, 'initial');
  shouldBe(div.style.borderRightStyle, 'initial');
  shouldBe(div.style.borderBottomStyle, 'initial');
  shouldBe(div.style.borderLeftStyle, 'initial');

  shouldBe(div.style.borderTopColor, 'initial');
  shouldBe(div.style.borderRightColor, 'initial');
  shouldBe(div.style.borderBottomColor, 'initial');
  shouldBe(div.style.borderLeftColor, 'initial');

  div.setAttribute('style', 'border: solid');
  shouldBe(div.style.borderTopWidth, 'initial');
  shouldBe(div.style.borderRightWidth, 'initial');
  shouldBe(div.style.borderBottomWidth, 'initial');
  shouldBe(div.style.borderLeftWidth, 'initial');
}
