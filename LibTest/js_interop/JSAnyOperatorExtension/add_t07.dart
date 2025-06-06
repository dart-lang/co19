// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a function as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var one = foo + 1;         // String "function foo() {}1"
    var string = foo + "s";    // String "function foo() {}s"
    var a1 = foo + [1, 2];     // String "function foo() {}1,2"
    var o1 = foo + {};         // String "function foo() {}[object Object]"
    var o2 = foo + {"a": "b"}; // String "function foo() {}[object Object]"
    var n = foo + null;        // String "function foo() {}null"
    var b1 = foo + true;       // String "function foo() {}true"
    var b2 = foo + false;      // String "function foo() {}false"
  ''');

  var f = globalContext["foo"];

  Expect.equals(globalContext["one"], f.add(1.toJS));
  Expect.equals(globalContext["string"], f.add("s".toJS));
  Expect.equals(globalContext["a1"], f.add([1, 2].jsify()));
  Expect.equals(globalContext["o1"], f.add(JSObject()));
  Expect.equals(globalContext["o2"], f.add({"a": "b"}.jsify()));
  Expect.equals(globalContext["n"], f.add(null.jsify()));
  Expect.equals(globalContext["n"], f.add(null));
  Expect.equals(globalContext["b1"], f.add(true.toJS));
  Expect.equals(globalContext["b2"], f.add(false.toJS));
}
