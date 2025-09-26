// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArrayBuffer get toJS
/// Converts this [ByteBuffer] to a [JSArrayBuffer] by either casting,
/// unwrapping, or cloning the [ByteBuffer].
///
/// Throws if the [ByteBuffer] wraps a JS `SharedArrayBuffer`.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [ByteBuffer]s are either `ArrayBuffer`s or
/// `SharedArrayBuffer`s so this will just check the type and cast, throwing
/// if it's a `SharedArrayBuffer`.
///
/// When compiling to Wasm, this [ByteBuffer] is a wrapper around an
/// `ArrayBuffer` if it was converted via [JSArrayBufferToByteBuffer.toDart].
/// If it is a wrapper, this getter unwraps it and either returns the
/// `ArrayBuffer` or throws if the unwrapped buffer was a `SharedArrayBuffer`.
/// If it's instantiated in Dart, this getter clones this [ByteBuffer]'s
/// values into a new [JSArrayBuffer].
///
/// Avoid assuming that modifications to this [ByteBuffer] will affect the
/// returned [JSArrayBuffer] and vice versa on all compilers unless it was
/// first converted via [JSArrayBufferToByteBuffer.toDart].
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  if (isJS) {
    ByteBuffer bb = Int8List.fromList([42]).buffer;
    Expect.identical(bb, bb.toJS);
    Expect.identical(bb, bb.toJS.toDart);
  }
}
