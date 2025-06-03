// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a `bool` as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(JSAny b) {
  eval("var b = $b;");
  eval(r'''
                             // If b == true, then:
    var one = b + 1;         // 2
    var string = b + "s";    // String "trues"
    var a1 = b + [];         // String "true"
    var a2 = b + [1, 2];     // String "true1,2"
    var o1 = b + {};         // String "true[object Object]"
    var o2 = b + {"a": "b"}; // String "true[object Object]"
    var n = b + null;        // 1
    var b1 = b + true;       // 2
    var b2 = b + false;      // 1
  ''');

  Expect.equals(globalContext["one"], b.add(1.toJS));
  Expect.equals(globalContext["string"], b.add("s".toJS));
  Expect.equals(globalContext["a1"], b.add([].jsify()));
  Expect.equals(globalContext["a2"], b.add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], b.add(JSObject()));
  Expect.equals(globalContext["o2"], b.add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], b.add(null.jsify()));
  Expect.equals(globalContext["n"], b.add(null));
  Expect.equals(globalContext["b1"], b.add(true.toJS));
  Expect.equals(globalContext["b2"], b.add(false.toJS));
}

main() {
  test(true.toJS);
  test(false.toJS);
}
