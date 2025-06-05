// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test a function as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var one = foo && 1;         // 1
    var string = foo && "s";    // "s"
    var a1 = foo && [];         // []
    var a2 = foo && [1, 2];     // [1,2]
    var n = foo && null;        // null
    var b1 = foo && true;       // true
    var b2 = foo && false;      // false
    var nan = foo && (0 / 0);   // NaN
    var f = foo && foo;           // function foo() {}
  ''');

  var f = globalContext["foo"];

  Expect.equals(globalContext["one"], f.and(1.toJS));
  Expect.equals(globalContext["string"], f.and("s".toJS));
  Expect.listEquals(globalContext["a1"].dartify(), f.and([].jsify()).dartify());
  Expect.listEquals(globalContext["a2"].dartify(), f.and([1, 2].jsify()).dartify());
  Expect.equals(globalContext["n"], f.and(null.jsify()));
  Expect.equals(globalContext["n"], f.and(null));
  Expect.equals(globalContext["b1"], f.and(true.toJS));
  Expect.equals(globalContext["b2"], f.and(false.toJS));
  Expect.equals(
    globalContext["nan"].dartify(), f.and((0 / 0).toJS).dartify(),
  );
  Expect.equals(globalContext["f"], f.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(
    "I am an object in Dart", (f.and(dartObj.jsify()).dartify() as Map)["id"],
  );
}
