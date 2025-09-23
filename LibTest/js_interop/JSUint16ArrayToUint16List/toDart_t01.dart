// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint16List get toDart
/// Converts this [JSUint16Array] to a [Uint16List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Uint16List]s are [JSUint16Array]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSUint16Array] will affect the [Uint16List] and
/// vice versa.
///
/// @description Check that this getter converts this [JSUint16Array] to a
/// [Uint16List] and modifications to [JSUint16Array] affect the [Uint16List]
/// and vice versa. Test [JSUint16Array] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = new Uint16Array([1, 2, 3]);");
  JSUint16Array a = globalContext["a"] as JSUint16Array;
  Uint16List l = a.toDart;
  Expect.listEquals([1, 2, 3], l.toList());

  a["2"] = 42.toJS;
  Expect.listEquals([1, 2, 42], l.toList());

  l[2] = 33;
  Expect.listEquals([1, 2, 33], a.toDart.toList());
}
