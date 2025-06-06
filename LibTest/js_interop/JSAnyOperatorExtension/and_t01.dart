// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test an empty JS object as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var object = {};
    var one = object && 1;         // 1
    var string = object && "s";    // s
    var a1 = object && [];         // []
    var a2 = object && [1, 2];     // [1,2]
    var n = object && null;        // null
    var b1 = object && true;       // true
    var b2 = object && false;      // false
    var nan = object && (0 / 0);   // NaN
    var f = object && foo;         // function foo() {}
  ''');

  Expect.equals(globalContext["one"], JSObject().and(1.toJS));
  Expect.equals(globalContext["string"], JSObject().and("s".toJS));
  Expect.listEquals(
    globalContext["a1"].dartify(),
    JSObject().and([].jsify()).dartify(),
  );
  Expect.listEquals(
    globalContext["a2"].dartify(),
    JSObject().and([1, 2].jsify()).dartify(),
  );
  Expect.equals(globalContext["n"], JSObject().and(null.jsify()));
  Expect.equals(globalContext["n"], JSObject().and(null));
  Expect.equals(globalContext["b1"], JSObject().and(true.toJS));
  Expect.equals(globalContext["b2"], JSObject().and(false.toJS));
  Expect.equals(
    globalContext["nan"].dartify(),
    JSObject().and((0 / 0).toJS).dartify(),
  );
  Expect.equals(globalContext["f"], JSObject().and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(
    "I am an object in Dart",
    (JSObject().and(dartObj.jsify()).dartify() as Map)["id"],
  );
}
