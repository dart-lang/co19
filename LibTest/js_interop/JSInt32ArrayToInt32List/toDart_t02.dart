// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32List get toDart
/// Converts this [JSInt32Array] to a [Int32List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Int32List]s are [JSInt32Array]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSInt32Array] will affect the [Int32List] and vice
/// versa.
///
/// @description Check that this getter converts this [JSInt32Array] to a
/// [Int32List] and modifications to [JSInt32Array] affect the [Int32List] and
/// vice versa. Test [JSInt32Array] created in Dart.
/// @author sgrekhov22@gmail.com
/// @issue 61515

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Int32List.fromList([42]).buffer;
  JSInt32Array a = JSInt32Array(buffer.toJS);
  Int32List l = a.toDart;
  Expect.listEquals([42], l.toList());

  a["0"] = 1.toJS;
  Expect.listEquals([1], l.toList());

  l[0] = -1;
  Expect.listEquals([-1], a.toDart.toList());
}
