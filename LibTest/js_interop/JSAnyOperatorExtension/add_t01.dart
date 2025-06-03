// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test an empty JS object as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    var object = {};
    var one = object + 1;         // String "[object Object]1"
    var string = object + "s";    // String "[object Object]s"
    var a1 = object + [];         // String "[object Object]"
    var a2 = object + [1, 2];     // String "[object Object]1,2"
    var o1 = object + {};         // String "[object Object][object Object]"
    var o2 = object + {"a": "b"}; // String "[object Object][object Object]"
    var n = object + null;        // String "[object Object]null"
    var b1 = object + true;       // String "[object Object]true"
    var b2 = object + false;      // String "[object Object]false"
  ''');

  Expect.equals(globalContext["one"], JSObject().add(1.toJS));
  Expect.equals(globalContext["string"], JSObject().add("s".toJS));
  Expect.equals(globalContext["a1"], JSObject().add([].jsify()));
  Expect.equals(globalContext["a2"], JSObject().add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], JSObject().add(JSObject()));
  Expect.equals(globalContext["o2"], JSObject().add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], JSObject().add(null.jsify()));
  Expect.equals(globalContext["n"], JSObject().add(null));
  Expect.equals(globalContext["b1"], JSObject().add(true.toJS));
  Expect.equals(globalContext["b2"], JSObject().add(false.toJS));
}
