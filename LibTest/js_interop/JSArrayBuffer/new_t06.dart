// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArrayBuffer( int length, [ JSObject options ])
/// Creates a JavaScript `ArrayBuffer` of size `length` using an optional
/// `options` JavaScript object that sets the `maxByteLength`.
///
/// @description Check that it is not an error if `options` is empty or contains
/// any other property than `maxByteLength`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS()
external JSObject get opt1;

@JS()
external JSObject get opt2;

main() {
  eval(r'''
    var opt1 = {'maxByteLength': 0, 'length': 1};
    var opt2 = {'maxByteLength': true, 'size': 0};
  ''');
  globalContext["a0"] = JSArrayBuffer(0, opt1);
  eval("var length0 = a0.byteLength;");
  Expect.equals(0, globalContext["length0"].dartify());

  globalContext["a1"] = JSArrayBuffer(1, opt2);
  eval("var length1 = a1.byteLength;");
  Expect.equals(1, globalContext["length1"].dartify());

  globalContext["a16"] = JSArrayBuffer(16, JSObject());
  eval("var length16 = a16.byteLength;");
  Expect.equals(16, globalContext["length16"].dartify());
}
