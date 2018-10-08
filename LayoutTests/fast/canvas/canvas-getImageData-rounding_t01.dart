/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the handling of non-integer source coordinates in
 * getImageData().
 */
import "../../testcommon.dart";

main() {
  dynamic ctx = createContext2d("canvas");

  dimensionsShouldBe(sx, sy, sw, sh, width, height)
  {
    var imageData = ctx.getImageData(sx, sy, sw, sh);
    debug('getImageData($sx, $sy, $sw, $sh)');
    shouldBe(imageData.width, width);
    shouldBe(imageData.height, height);
  }

  // Basic integer values
  dimensionsShouldBe(   0,  0,   20,  10,     20, 10);

  // Source point is not an integer
  dimensionsShouldBe(  .1, .2,   20,  10,     21, 11);
  dimensionsShouldBe(  .9, .8,   20,  10,     21, 11);

  // Size is not an integer
  dimensionsShouldBe(   0,  0, 19.9, 9.9,     20, 10);
  dimensionsShouldBe(   0,  0, 19.1, 9.1,     20, 10);

  // Width straddles a pixel boundary
  dimensionsShouldBe(  .9,  0,   .2,  10,      2, 10);

  // Basic integer negative values
  dimensionsShouldBe(  -1, -1,   20,  10,     20, 10);

  // Non-integer negative values
  dimensionsShouldBe(-1.1,  0,   20,  10,     21, 10);
  dimensionsShouldBe(-1.9,  0,   20,  10,     21, 10);
}
