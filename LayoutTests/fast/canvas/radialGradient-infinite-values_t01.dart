/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks createRadialGradient with infinite values
 */
import "../../testcommon.dart";

var NaN = double.nan;
var Infinity = double.infinity;
var NegInfinity = double.negativeInfinity;

main() {
  dynamic ctx = createContext2d("canvas");

  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, 0, 0, NaN));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, 0, 0, Infinity));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, 0, 0, NegInfinity));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, 0, NaN, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, 0, Infinity, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, 0, NegInfinity, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, NaN, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, Infinity, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, 100, NegInfinity, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, NaN, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, Infinity, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, 0, NegInfinity, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, NaN, 100, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, Infinity, 100, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(0, NegInfinity, 100, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(NaN, 0, 100, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(Infinity, 0, 100, 0, 0, 100));
  shouldThrow(() => ctx.createRadialGradient(NegInfinity, 0, 100, 0, 0, 100));
}
