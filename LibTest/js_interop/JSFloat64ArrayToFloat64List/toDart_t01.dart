// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Float64List get toDart
/// Converts this [JSFloat64Array] to a [Float64List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Float64List]s are [JSFloat64Array]s and
/// this operation will be a cast. When compiling to Wasm, a wrapper is
/// introduced. Modifications to this [JSFloat64Array] will affect the
/// [Float64List] and vice versa.
///
/// @description Check that this getter converts this [JSFloat64Array] to a
/// [Float64List] and modifications to [JSFloat64Array] affect the [Float64List]
/// and vice versa. Test [JSFloat64Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Float64Array([1, -2.2, 3.14]);");
  JSFloat64Array a = globalContext["a"] as JSFloat64Array;
  Float64List l = a.toDart;
  Expect.listApproxEquals([1, -2.2, 3.14], l.toList());

  a["2"] = 42.42.toJS;
  Expect.listApproxEquals([1, -2.2, 42.42], l.toList());

  l[2] = -3.14;
  Expect.listApproxEquals([1, -2.2, -3.14], a.toDart.toList());
}
