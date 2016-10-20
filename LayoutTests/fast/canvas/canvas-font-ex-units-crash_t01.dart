/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that setting a font with size in 'ex' units doesn't crash.
 */
import "../../testcommon.dart";

main() {
  dynamic ctx = createContext2d("canvas");

  ctx.font = "5ex sans-serif";

  var size = int.parse(ctx.font.substring(0, 2));
  var family = ctx.font.substring(5);

  shouldBeCloseTo(size, 25, 10);
  shouldBe(family, 'sans-serif');
}
