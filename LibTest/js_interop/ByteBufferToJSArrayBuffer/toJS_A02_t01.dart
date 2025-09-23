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
/// @description Check that this getter throws if the [ByteBuffer] wraps a JS
/// `SharedArrayBuffer`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
  if (globalThis.crossOriginIsolated) {
    globalThis.sab = new SharedArrayBuffer(4);
  }
  ''');
  var sab = globalContext["sab"];
  if (sab != null) {
    ByteBuffer bb = (sab as JSArrayBuffer).toDart;
    Expect.throws(() {
      bb.toJS;
    });
  }
}
