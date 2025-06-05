// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test a non-empty string as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var o = "s";
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

  Expect.equals(globalContext["one"], "s".toJS.and(1.toJS));
  Expect.equals(globalContext["string"], "s".toJS.and("s".toJS));
  Expect.listEquals(
    globalContext["a1"].dartify(),
    "s".toJS.and([].jsify()).dartify(),
  );
  Expect.listEquals(
    globalContext["a2"].dartify(),
    "s".toJS.and([1, 2].jsify()).dartify(),
  );
  Expect.equals(globalContext["n"], "s".toJS.and(null.jsify()));
  Expect.equals(globalContext["n"], "s".toJS.and(null));
  Expect.equals(globalContext["b1"], "s".toJS.and(true.toJS));
  Expect.equals(globalContext["b2"], "s".toJS.and(false.toJS));
  Expect.equals(
    globalContext["nan"].dartify(),
    "s".toJS.and((0 / 0).toJS).dartify(),
  );
  Expect.equals(globalContext["f"], "s".toJS.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(
    "I am an object in Dart",
    ("s".toJS.and(dartObj.jsify()).dartify() as Map)["id"],
  );
}
