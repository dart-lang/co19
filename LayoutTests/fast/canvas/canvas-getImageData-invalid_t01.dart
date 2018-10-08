/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the handling of invalid arguments in canvas
 * getImageData().
 */
import "../../testcommon.dart";

var NaN = double.nan;
var Inf = double.infinity;
var NegInf = double.negativeInfinity;

main() {
  dynamic ctx = createContext2d("canvas");

  debug('test 01'); shouldThrow(() => ctx.getImageData(NaN, 10, 10, 10));
  debug('test 02'); shouldThrow(() => ctx.getImageData(10, NaN, 10, 10));
  debug('test 03'); shouldThrow(() => ctx.getImageData(10, 10, NaN, 10));
  debug('test 04'); shouldThrow(() => ctx.getImageData(10, 10, 10, NaN));
  debug('test 05'); shouldThrow(() => ctx.getImageData(Inf, 10, 10, 10));
  debug('test 06'); shouldThrow(() => ctx.getImageData(10, Inf, 10, 10));
  debug('test 07'); shouldThrow(() => ctx.getImageData(10, 10, Inf, 10));
  debug('test 08'); shouldThrow(() => ctx.getImageData(10, 10, 10, Inf));
  debug('test 09'); shouldThrow(() => ctx.getImageData(null, 10, 10, 10));
  debug('test 10'); shouldThrow(() => ctx.getImageData(10, null, 10, 10));
  debug('test 11'); shouldThrow(() => ctx.getImageData(10, 10, null, 10));
  debug('test 12'); shouldThrow(() => ctx.getImageData(10, 10, 10, null));
  debug('test 13'); shouldThrow(() => ctx.getImageData(10, 10, 0, 10));
  debug('test 14'); shouldThrow(() => ctx.getImageData(10, 10, 10, 0));
}
