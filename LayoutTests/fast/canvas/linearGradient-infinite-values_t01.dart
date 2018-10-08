/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks createLinearGradient with infinite values
 */
import "../../testcommon.dart";

var NaN = double.nan;
var Infinity = double.infinity;
var NegInfinity = double.negativeInfinity;

main() {
  dynamic ctx = createContext2d("canvas");

  shouldThrow(() => ctx.createLinearGradient(0, 0, 100, NaN));
  shouldThrow(() => ctx.createLinearGradient(0, 0, 100, Infinity));
  shouldThrow(() => ctx.createLinearGradient(0, 0, 100, NegInfinity));
  shouldThrow(() => ctx.createLinearGradient(0, 0, NaN, 100));
  shouldThrow(() => ctx.createLinearGradient(0, 0, Infinity, 100));
  shouldThrow(() => ctx.createLinearGradient(0, 0, NegInfinity, 100));
  shouldThrow(() => ctx.createLinearGradient(0, NaN, 100, 100));
  shouldThrow(() => ctx.createLinearGradient(0, Infinity, 100, 100));
  shouldThrow(() => ctx.createLinearGradient(0, NegInfinity, 100, 100));
  shouldThrow(() => ctx.createLinearGradient(NaN, 0, 100, 100));
  shouldThrow(() => ctx.createLinearGradient(Infinity, 0, 100, 100));
  shouldThrow(() => ctx.createLinearGradient(NegInfinity, 0, 100, 100));
}
