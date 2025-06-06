// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test `false` as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var o = false;
    var one = o && 1;         // false
    var string = o && "s";    // false
    var a1 = o && [];         // false
    var a2 = o && [1, 2];     // false
    var n = o && null;        // false
    var b1 = o && true;       // false
    var b2 = o && false;      // false
    var nan = o && (0 / 0);   // false
    var f = o && foo;         // false
  ''');

  Expect.equals(globalContext["one"], false.toJS.and(1.toJS));
  Expect.equals(globalContext["string"], false.toJS.and("s".toJS));
  Expect.equals(globalContext["a1"], false.toJS.and([].jsify()));
  Expect.equals(globalContext["a2"], false.toJS.and([1, 2].jsify()));
  Expect.equals(globalContext["n"], false.toJS.and(null.jsify()));
  Expect.equals(globalContext["n"], false.toJS.and(null));
  Expect.equals(globalContext["b1"], false.toJS.and(true.toJS));
  Expect.equals(globalContext["b2"], false.toJS.and(false.toJS));
  Expect.equals(
    globalContext["nan"].dartify(),
    false.toJS.and((0 / 0).toJS).dartify(),
  );
  Expect.equals(globalContext["f"], false.toJS.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.isFalse(false.toJS.and(dartObj.jsify()).dartify() as bool);
}
