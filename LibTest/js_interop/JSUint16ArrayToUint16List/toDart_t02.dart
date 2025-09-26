// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint16List get toDart
/// Converts this [JSUint16Array] to a [Uint16List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Uint16List]s are [JSUint16Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSUint16Array] is wrapped with a [Uint16List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSUint16Array] will affect the returned
/// [Uint16List] and vice versa.
///
/// @description Check that this getter converts this [JSUint16Array] to a
/// [Uint16List] and modifications to [JSUint16Array] affect the [Uint16List]
/// and vice versa. Test [JSUint16Array] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Uint16List.fromList([42]).buffer;
  JSUint16Array a = JSUint16Array(buffer.toJS);
  Uint16List l = a.toDart;
  Expect.listEquals([42], l.toList());

  a["0"] = 1.toJS;
  Expect.listEquals([1], l.toList());

  l[0] = 11;
  Expect.listEquals([11], a.toDart.toList());
}
