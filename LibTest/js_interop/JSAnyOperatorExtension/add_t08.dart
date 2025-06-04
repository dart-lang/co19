// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a function as `any`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var one = 1 + foo;         // String "1function foo() {}"
    var string = "s" + foo;    // String "sfunction foo() {}"
    var a1 = [1, 2] + foo;     // String "1,2function foo() {}"
    var o1 = {} + foo;         // String "[object Object]function foo() {}"
    var o2 = {"a": "b"} + foo; // String "[object Object]function foo() {}"
    var n = null + foo;        // String "nullfunction foo() {}null"
    var b1 = true + foo;       // String "truefunction foo() {}"
    var b2 = false + foo;      // String "falsefunction foo() {}"
  ''');

  var f = globalContext["foo"];

  Expect.equals(globalContext["one"], 1.toJS.add(f));
  Expect.equals(globalContext["string"], "s".toJS.add(f));
  Expect.equals(globalContext["a1"], [1, 2].jsify().add(f));
  Expect.equals(globalContext["o1"], JSObject().add(f));
  Expect.equals(globalContext["o2"], {"a": "b"}.jsify().add(f));
  Expect.equals(globalContext["n"], null.jsify().add(f));
  Expect.equals(globalContext["n"], null.add(f));
  Expect.equals(globalContext["b1"], true.toJS.add(f));
  Expect.equals(globalContext["b2"], false.toJS.add(f));
}
