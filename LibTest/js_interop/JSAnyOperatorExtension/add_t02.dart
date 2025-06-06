// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a number as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(JSAny o) {
  eval("var o = $o;");
  eval(r'''
                             // If o == 42, then:
    var one = o + 1;         // 43
    var string = o + "s";    // String "42s"
    var a1 = o + [];         // String "42"
    var a2 = o + [1, 2];     // String "421,2"
    var o1 = o + {};         // String "42[object Object]"
    var o2 = o + {"a": "b"}; // String "42[object Object]"
    var n = o + null;        // 42
    var b1 = o + true;       // 43
    var b2 = o + false;      // 42
  ''');

  Expect.equals(globalContext["one"], o.add(1.toJS));
  Expect.equals(globalContext["string"], o.add("s".toJS));
  Expect.equals(globalContext["a1"], o.add([].jsify()));
  Expect.equals(globalContext["a2"], o.add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], o.add(JSObject()));
  Expect.equals(globalContext["o1"], o.add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], o.add(null.jsify()));
  Expect.equals(globalContext["n"], o.add(null));
  Expect.equals(globalContext["b1"], o.add(true.toJS));
  Expect.equals(globalContext["b2"], o.add(false.toJS));
}

main() {
  test(0.toJS);
  test((-1).toJS);
  test(42.toJS);
  test(3.14.toJS);
}
