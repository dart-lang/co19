// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArrayBuffer( int length, [ JSObject options ])
/// Creates a JavaScript `ArrayBuffer` of size `length` using an optional
/// `options` JavaScript object that sets the `maxByteLength`.
///
/// @description Check that this constructor throws if `length` is more than
/// `maxByteLength`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external JSObject get opt0;

@JS()
external JSObject get opt1;

@JS()
external JSObject get opt32;

main() {
  eval(r'''
    globalThis.opt0 = {'maxByteLength': 0};
    globalThis.opt1 = {'maxByteLength': 1};
    globalThis.opt32 = {'maxByteLength': 32};
  ''');
  Expect.throws(() {
    JSArrayBuffer(1, opt0);
  });
  Expect.throws(() {
    JSArrayBuffer(2, opt1);
  });
  Expect.throws(() {
    JSArrayBuffer(64, opt32);
  });
}
