// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint8List get toDart
/// Converts this [JSUint8Array] to a [Uint8List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Uint8List]s are [JSUint8Array]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSUint8Array] will affect the [Uint8List] and vice
/// versa.
///
/// @description Check that this getter converts this [JSUint8Array] to a
/// [Uint8List] and modifications to [JSUint8Array] affect the [Uint8List] and
/// vice versa. Test [JSUint8Array] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Uint8List.fromList([42]).buffer;
  JSUint8Array a = JSUint8Array(buffer.toJS);
  Uint8List l = a.toDart;
  Expect.listEquals([42], l.toList());

  a["0"] = 1.toJS;
  Expect.listEquals([1], l.toList());

  l[0] = 11;
  Expect.listEquals([11], a.toDart.toList());
}
