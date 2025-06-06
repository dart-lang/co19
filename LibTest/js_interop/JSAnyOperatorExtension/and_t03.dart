// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test `0` as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
  
    var o = 0;
    var one = o && 1;         // 0
    var string = o && "s";    // 0
    var a1 = o && [];         // 0
    var a2 = o && [1, 2];     // 0
    var n = o && null;        // 0
    var b1 = o && true;       // 0
    var b2 = o && false;      // 0
    var nan = o && (0 / 0);   // 0
    var f = o && foo;         // 0
  ''');

  Expect.equals(globalContext["one"], 0.toJS.and(1.toJS));
  Expect.equals(globalContext["string"], 0.toJS.and("s".toJS));
  Expect.equals(globalContext["a1"], 0.toJS.and([].jsify()));
  Expect.equals(globalContext["a2"], 0.toJS.and([1, 2].jsify()));
  Expect.equals(globalContext["n"], 0.toJS.and(null.jsify()));
  Expect.equals(globalContext["n"], 0.toJS.and(null));
  Expect.equals(globalContext["b1"], 0.toJS.and(true.toJS));
  Expect.equals(globalContext["b2"], 0.toJS.and(false.toJS));
  Expect.equals(globalContext["nan"], 0.toJS.and((0 / 0).toJS));
  Expect.equals(globalContext["f"], 0.toJS.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(0, 0.toJS.and(dartObj.jsify()).dartify());
}
