// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a string as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    var object = 's';
    var one = object + 1;         // String "s1"
    var string = object + "s";    // String "ss"
    var a1 = object + [];         // String "s"
    var a2 = object + [1, 2];     // String "s1,2"
    var o1 = object + {};         // String "s[object Object]"
    var o2 = object + {"a": "b"}; // String "s[object Object]"
    var n = object + null;        // String "snull"
    var b1 = object + true;       // String "strue"
    var b2 = object + false;      // String "sfalse"
  ''');

  final s = "s".toJS;
  Expect.equals(globalContext["one"], s.add(1.toJS));
  Expect.equals(globalContext["string"], s.add("s".toJS));
  Expect.equals(globalContext["a1"], s.add([].jsify()));
  Expect.equals(globalContext["a2"], s.add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], s.add(JSObject()));
  Expect.equals(globalContext["o2"], s.add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], s.add(null.jsify()));
  Expect.equals(globalContext["n"], s.add(null));
  Expect.equals(globalContext["b1"], s.add(true.toJS));
  Expect.equals(globalContext["b2"], s.add(false.toJS));
}
