// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32List get toDart
/// Converts this [JSInt32Array] to a [Int32List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Int32List]s are [JSInt32Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSInt32Array] is wrapped with a [Int32List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSInt32Array] will affect the returned [Int32List]
/// and vice versa.
///
/// @description Check that this getter converts this [JSInt32Array] to a
/// [Int32List] and modifications to [JSInt32Array] affect the [Int32List] and
/// vice versa. Test [JSInt32Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Int32Array([1, -2, 3]);");
  JSInt32Array a = globalContext["a"] as JSInt32Array;
  Int32List l = a.toDart;
  Expect.listEquals([1, -2, 3], l.toList());

  a["2"] = 42.toJS;
  Expect.listEquals([1, -2, 42], l.toList());

  l[2] = -3;
  Expect.listEquals([1, -2, -3], a.toDart.toList());
}
