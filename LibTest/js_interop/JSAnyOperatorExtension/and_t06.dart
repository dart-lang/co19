// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test an empty string as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var o = "";
    var one = o && 1;         // ""
    var string = o && "s";    // ""
    var a1 = o && [];         // ""
    var a2 = o && [1, 2];     // ""
    var n = o && null;        // ""
    var b1 = o && true;       // ""
    var b2 = o && false;      // ""
    var nan = o && (0 / 0);   // ""
    var f = o && foo;         // ""
  ''');

  Expect.equals(globalContext["one"], "".toJS.and(1.toJS));
  Expect.equals(globalContext["string"], "".toJS.and("s".toJS));
  Expect.deepEquals(globalContext["a1"], "".toJS.and([].jsify()));
  Expect.deepEquals(globalContext["a2"], "".toJS.and([1, 2].jsify()));
  Expect.equals(globalContext["n"], "".toJS.and(null.jsify()));
  Expect.equals(globalContext["n"], "".toJS.and(null));
  Expect.equals(globalContext["b1"], "".toJS.and(true.toJS));
  Expect.equals(globalContext["b2"], "".toJS.and(false.toJS));
  Expect.equals(
    globalContext["nan"].dartify(),
    "".toJS.and((0 / 0).toJS).dartify(),
  );
  Expect.equals(globalContext["f"], "".toJS.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals("", "".toJS.and(dartObj.jsify()).dartify());
}
