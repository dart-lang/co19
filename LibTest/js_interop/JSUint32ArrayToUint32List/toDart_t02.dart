// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint32List get toDart
/// Converts this [JSUint32Array] to a [Uint32List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Uint32List]s are [JSUint32Array]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSUint32Array] will affect the [Uint32List] and
/// vice versa.
///
/// @description Check that this getter converts this [JSUint32Array] to a
/// [Uint32List] and modifications to [JSInt16Array] affect the [Uint32List] and
/// vice versa. Test [JSUint32Array] created in Dart.
/// @author sgrekhov22@gmail.com
/// @issue 61515

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Uint32List.fromList([42]).buffer;
  JSUint32Array a = JSUint32Array(buffer.toJS);
  Uint32List l = a.toDart;
  Expect.listEquals([42], l.toList());

  a["0"] = 1.toJS;
  Expect.listEquals([1], l.toList());

  l[0] = 11;
  Expect.listEquals([11], a.toDart.toList());
}
