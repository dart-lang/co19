// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArrayBuffer( int length, [ JSObject options ])
/// Creates a JavaScript `ArrayBuffer` of size `length` using an optional
/// `options` JavaScript object that sets the `maxByteLength`.
///
/// @description Check that this constructor throws if `maxByteLength` contains
/// an invalid value.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external JSObject get optNaN;

@JS()
external JSObject get optText;

main() {
  eval(r'''
    globalThis.optNaN = {'maxByteLength': 0 / 0};
    globalThis.optText = {'maxByteLength': 'text'};
  ''');
  Expect.throws(() {
    JSArrayBuffer(1, optNaN);
  });
  Expect.throws(() {
    JSArrayBuffer(2, optText);
  });
}
