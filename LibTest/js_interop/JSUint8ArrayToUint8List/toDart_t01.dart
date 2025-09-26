// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint8List get toDart
/// Converts this [JSUint8Array] to a [Uint8List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Uint8List]s are [JSUint8Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSUint8Array] is wrapped with a [Uint8List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSUint8Array] will affect the returned [Uint8List]
/// and vice versa.
///
/// @description Check that this getter converts this [JSUint8Array] to a
/// [Uint8List] and modifications to [JSUint8Array] affect the [Uint8List] and
/// vice versa. Test [JSUint8Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Uint8Array([1, 2, 3]);");
  JSUint8Array a = globalContext["a"] as JSUint8Array;
  Uint8List l = a.toDart;
  Expect.listEquals([1, 2, 3], l.toList());

  a["2"] = 42.toJS;
  Expect.listEquals([1, 2, 42], l.toList());

  l[2] = 33;
  Expect.listEquals([1, 2, 33], a.toDart.toList());
}
