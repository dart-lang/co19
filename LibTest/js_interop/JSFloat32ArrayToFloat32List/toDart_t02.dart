// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Float32List get toDart
/// Converts this [JSFloat32Array] to a [Float32List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Float32List]s are [JSFloat32Array]s and
/// this operation will be a cast. When compiling to Wasm, a wrapper is
/// introduced. Modifications to this [JSFloat32Array] will affect the
/// [Float32List] and vice versa.
///
/// @description Check that this getter converts this [JSFloat32Array] to a
/// [Float32List] and modifications to [JSFloat32Array] affect the [Float32List]
/// and vice versa. Test [JSInt32Array] created in Dart.
/// @author sgrekhov22@gmail.com
/// @issue 61515

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Float32List.fromList([3.14]).buffer;
  JSFloat32Array a = JSFloat32Array(buffer.toJS);
  Float32List l = a.toDart;
  Expect.listApproxEquals([3.14], l.toList());

  a["0"] = (-3.14).toJS;
  Expect.listApproxEquals([-3.14], l.toList());

  l[0] = 1.1;
  Expect.listApproxEquals([1.1], a.toDart.toList());
}
