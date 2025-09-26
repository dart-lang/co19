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
/// @description Check that on `dart2wasm` if [ByteBuffer] was instantiated in
/// JavaScript then this operations unwraps it and therefore changes in the
/// original object affect the one returned by this operation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.buffer = new ArrayBuffer(1);
    globalThis.view = new Int8Array(globalThis.buffer);
    globalThis.view[0] = 42;
  ''');
  ByteBuffer bb = (globalContext["buffer"] as JSArrayBuffer).toDart;
  JSArrayBuffer ab = bb.toJS;
  eval("globalThis.view[0] = 1;");
  JSInt8Array arr = JSInt8Array(ab);
  Expect.equals(1, arr.toDart[0]);
}
