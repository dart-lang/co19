// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test an array as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(JSAny? a) {
  eval("var object = $a;");
  eval(r'''
                                  // If object == [1, 2] then:
    var one = object + 1;         // String "1, 21"
    var string = object + "s";    // String "1, 2s"
    var a1 = object + [];         // String "1, 2"
    var a2 = object + [1, 2];     // String "1, 21,2"
    var o1 = object + {};         // String "1, 2[object Object]"
    var o2 = object + {"a": "b"}; // String "1, 2[object Object]"
    var n = object + null;        // String "1, 2null"
    var b1 = object + true;       // String "1, 2true"
    var b2 = object + false;      // String "1, 2false"
  ''');

  Expect.equals(globalContext["one"], a.add(1.toJS));
  Expect.equals(globalContext["string"], a.add("s".toJS));
  Expect.equals(globalContext["a1"], a.add([].jsify()));
  Expect.equals(globalContext["a2"], a.add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], a.add(JSObject()));
  Expect.equals(globalContext["o2"], a.add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], a.add(null.jsify()));
  Expect.equals(globalContext["n"], a.add(null));
  Expect.equals(globalContext["b1"], a.add(true.toJS));
  Expect.equals(globalContext["b2"], a.add(false.toJS));
}

main() {
  test([].jsify());
  test([1, 2].jsify());
}
