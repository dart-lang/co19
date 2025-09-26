// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int8List get toDart
/// Converts this [JSInt8Array] to a [Int8List] by either casting or wrapping
/// it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Int8List]s are [JSInt8Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSInt8Array] is wrapped with a [Int8List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSInt8Array] will affect the returned [Int8List]
/// and vice versa.
///
/// @description Check that this getter converts this [JSInt8Array] to a
/// [Int8List] and modifications to [JSInt8Array] affect the [Int8List] and vice
/// versa. Test [JSInt8Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Int8Array([1, -2, 3]);");
  JSInt8Array a = globalContext["a"] as JSInt8Array;
  Int8List l = a.toDart;
  Expect.listEquals([1, -2, 3], l.toList());

  a["2"] = 42.toJS;
  Expect.listEquals([1, -2, 42], l.toList());

  l[2] = -3;
  Expect.listEquals([1, -2, -3], a.toDart.toList());
}
