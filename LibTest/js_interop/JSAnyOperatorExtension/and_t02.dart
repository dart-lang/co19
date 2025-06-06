// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test a non-zero number as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(JSAny o) {
  eval("var o = $o;");
  eval(r'''
    function foo() {}
  
    var one = o && 1;         // 1
    var string = o && "s";    // "s"
    var a1 = o && [];         // []
    var a2 = o && [1, 2];     // [1,2]
    var n = o && null;        // null
    var b1 = o && true;       // true
    var b2 = o && false;      // false
    var nan = o && (0 / 0);   // NaN
    var f = o && foo;         // function foo() {}
  ''');

  Expect.equals(globalContext["one"], o.and(1.toJS));
  Expect.equals(globalContext["string"], o.and("s".toJS));
  Expect.listEquals(globalContext["a1"].dartify(), o.and([].jsify()).dartify());
  Expect.listEquals(
    globalContext["a2"].dartify(),
    o.and([1, 2].jsify()).dartify(),
  );
  Expect.equals(globalContext["n"], o.and(null.jsify()));
  Expect.equals(globalContext["n"], o.and(null));
  Expect.equals(globalContext["b1"], o.and(true.toJS));
  Expect.equals(globalContext["b2"], o.and(false.toJS));
  Expect.equals(globalContext["nan"].dartify(), o.and((0 / 0).toJS).dartify());
  Expect.equals(globalContext["f"], o.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(
    "I am an object in Dart",
    (o.and(dartObj.jsify()).dartify() as Map)["id"],
  );
}

main() {
  test(42.toJS);
  test((-1).toJS);
  test(3.14.toJS);
}
