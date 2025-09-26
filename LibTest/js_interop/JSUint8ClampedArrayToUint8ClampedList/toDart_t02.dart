// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint8ClampedList get toDart
/// Converts this [JSUint8ClampedArray] to a [Uint8ClampedList] by either
/// casting or wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Uint8ClampedList]s are
/// [JSUint8ClampedArray]s and this getter will be a cast.
///
/// When compiling to Wasm, the [JSUint8ClampedArray] is wrapped with a
/// [Uint8ClampedList] implementation and the wrapper is returned.
///
/// Modifications to this [JSUint8ClampedArray] will affect the returned
/// [Uint8ClampedList] and vice versa.
///
/// @description Check that this getter converts this [JSUint8ClampedArray] to a
/// [Uint8ClampedList] and modifications to [JSUint8ClampedArray] affect the
/// [Uint8ClampedList] and vice versa. Test [Uint8ClampedList] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  ByteBuffer buffer = Uint8ClampedList.fromList([42]).buffer;
  JSUint8ClampedArray a = JSUint8ClampedArray(buffer.toJS);
  Uint8ClampedList l = a.toDart;
  Expect.listEquals([42], l.toList());

  a["0"] = 1.toJS;
  Expect.listEquals([1], l.toList());

  l[0] = 11;
  Expect.listEquals([11], a.toDart.toList());
}
