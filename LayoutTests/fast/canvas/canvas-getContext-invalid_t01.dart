/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that invalid canvas getContext() requests return null.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');

  shouldBe(canvas.getContext(''), null);
  shouldBe(canvas.getContext('2d#'), null);
  shouldBe(canvas.getContext('This is clearly not a valid context name.'), null);
  shouldBe(canvas.getContext('2d\0'), null);
  shouldBe(canvas.getContext('2\uFF44'), null);
  shouldBe(canvas.getContext('2D'), null);
}
