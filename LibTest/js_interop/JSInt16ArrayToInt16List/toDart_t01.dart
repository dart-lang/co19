// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int16List get toDart
/// Converts this [JSInt16Array] to a [Int16List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Int16List]s are [JSInt16Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSInt16Array] is wrapped with a [Int16List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSInt16Array] will affect the returned [Int16List]
/// and vice versa.
///
/// @description Check that this getter converts this [JSInt16Array] to a
/// [Int16List] and modifications to [JSInt16Array] affect the [Int16List] and
/// vice versa. Test [JSInt16Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Int16Array([1, -2, 3]);");
  JSInt16Array a = globalContext["a"] as JSInt16Array;
  Int16List l = a.toDart;
  Expect.listEquals([1, -2, 3], l.toList());

  a["2"] = 42.toJS;
  Expect.listEquals([1, -2, 42], l.toList());

  l[2] = -3;
  Expect.listEquals([1, -2, -3], a.toDart.toList());
}
