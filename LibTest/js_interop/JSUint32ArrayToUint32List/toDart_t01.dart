// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint32List get toDart
/// Converts this [JSUint32Array] to a [Uint32List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Uint32List]s are [JSUint32Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSUint32Array] is wrapped with a [Uint32List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSUint32Array] will affect the returned
/// [Uint32List] and vice versa.
///
/// @description Check that this getter converts this [JSUint32Array] to a
/// [Uint32List] and modifications to [JSUint16Array] affect the [Uint32List] and
/// vice versa. Test [JSUint32Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Uint32Array([1, 2, 3]);");
  JSUint32Array a = globalContext["a"] as JSUint32Array;
  Uint32List l = a.toDart;
  Expect.listEquals([1, 2, 3], l.toList());

  a["2"] = 42.toJS;
  Expect.listEquals([1, 2, 42], l.toList());

  l[2] = 33;
  Expect.listEquals([1, 2, 33], a.toDart.toList());
}
