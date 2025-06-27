// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A JavaScript number
///
/// @description Check that `JSNumber` can store Dart `int` and `double` values.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:math';
import '../js_utils.dart';

test(num v1, num v2) {
  eval("globalThis.n1 = $v1;");
  eval("globalThis.n2 = $v2;");
  eval("globalThis.sum = n1 + n2;");

  JSNumber n1 = globalContext["n1"] as JSNumber;
  JSNumber n2 = globalContext["n2"] as JSNumber;
  JSAny sum = n1.add(n2);
  jsExpectEquals(globalContext["sum"], sum);
}

main() {
  test(0, 1);
  test(42, 123);
  test(pow(2, 53) - 1 as int, 0);
  test(-42, 123);
  test(-pow(2, 53) - 1 as int, -42);

  test(0.0, -1.1);
  test(42.1, 123.123);
  test(pow(2, 53) - 1 as double, -0.1);
  test(-42, 123);
  test(-pow(2, 53) - 1 as double, -0.0);
}
