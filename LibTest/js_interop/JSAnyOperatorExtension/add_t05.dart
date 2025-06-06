// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test `null` as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(JSAny? n) {
  eval(r'''
    var object = null;
    var one = object + 1;         // 1
    var string = object + "s";    // String "nulls"
    var a1 = object + [];         // String "null"
    var a2 = object + [1, 2];     // String "null1,2"
    var o1 = object + {};         // String "null[object Object]"
    var o2 = object + {"a": "b"}; // String "null[object Object]"
    var n = object + null;        // 0
    var b1 = object + true;       // 1
    var b2 = object + false;      // 0
  ''');

  Expect.equals(globalContext["one"], n.add(1.toJS));
  Expect.equals(globalContext["string"], n.add("s".toJS));
  Expect.equals(globalContext["a1"], n.add([].jsify()));
  Expect.equals(globalContext["a2"], n.add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], n.add(JSObject()));
  Expect.equals(globalContext["o2"], n.add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], n.add(null.jsify()));
  Expect.equals(globalContext["n"], n.add(null));
  Expect.equals(globalContext["b1"], n.add(true.toJS));
  Expect.equals(globalContext["b2"], n.add(false.toJS));
}

main() {
  test(null.jsify());
  test(null);
}
