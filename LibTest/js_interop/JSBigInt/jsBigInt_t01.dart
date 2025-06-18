// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript `BigInt`
///
/// @description Check that `JSBigInt` can store big integer values (more that
/// 2^53 - 1).
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:math';
import '../js_utils.dart';

test(int v1, int v2) {
  eval("globalThis.bi1 = ${v1}n;");
  eval("globalThis.bi2 = ${v2}n;");
  eval("globalThis.sum = bi1 + bi2;");

  JSBigInt bi1 = globalContext["bi1"] as JSBigInt;
  JSBigInt bi2 = globalContext["bi2"] as JSBigInt;
  JSAny sum = bi1.add(bi2);
  jsExpectEquals(globalContext["sum"], sum);
}

main() {
  test(0, 1);
  test(42, 123);
  test(pow(2, 53) as int, 42);
  test(pow(2, 53) as int, pow(2, 54) as int);
  test(-42, 123);
  test(-pow(2, 53) as int, 42);
  test(-pow(2, 53) as int, pow(2, 54) as int);
}
