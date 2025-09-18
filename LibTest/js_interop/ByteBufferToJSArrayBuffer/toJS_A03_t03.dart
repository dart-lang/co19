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
/// > When compiling to JavaScript, [ByteBuffer]s are either `ArrayBuffer`s or
/// > `SharedArrayBuffer`s so this will just check the type and cast.
/// > When compiling to Wasm, this [ByteBuffer] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it and either returns the
/// > `ArrayBuffer` or throws if the unwrapped buffer was a
/// > `SharedArrayBuffer`. If it's instantiated in Dart, this method clones
/// > this [ByteBuffer]'s values into a new [JSArrayBuffer].
/// > Avoid assuming that modifications to this [ByteBuffer] will affect the
/// > [JSArrayBuffer] and vice versa unless it was instantiated in JavaScript.
///
/// @description Check that on `dart2wasm` if [ByteBuffer] was instantiated in
/// Dart then this operations clones it. Hence, changes in the original object
/// do not affect the cloned one.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  Int8List list = Int8List.fromList([42]);
  ByteBuffer bb = list.buffer;
  JSArrayBuffer ab = bb.toJS;
  list[0] = 1;

  globalContext["ab"] = ab;
  eval("globalThis.list = new Int8Array(globalThis.ab);");
  JSInt8Array l = globalContext["list"] as JSInt8Array;
  if (isWasm) {
    Expect.equals(42, l.toDart[0]);
  }
  if (isJS) {
    // In case of JS `toJS` just casts and therefore this is the same object
    Expect.equals(1, l.toDart[0]);
  }
}
