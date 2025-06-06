// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test a `NaN` as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
    
    var o = 0 / 0;
    var one = o && 1;         // NaN
    var string = o && "s";    // NaN
    var a1 = o && [];         // NaN
    var a2 = o && [1, 2];     // NaN
    var n = o && null;        // NaN
    var b1 = o && true;       // NaN
    var b2 = o && false;      // NaN
    var nan = o && (0 / 0);   // NaN
    var f = o && foo;         // NaN
  ''');

  var nan = (0 / 0);
  Expect.equals(globalContext["one"].dartify(), nan.toJS.and(1.toJS).dartify());
  Expect.equals(
    globalContext["string"].dartify(),
    nan.toJS.and("s".toJS).dartify(),
  );
  Expect.equals(
    globalContext["a1"].dartify(),
    nan.toJS.and([].jsify()).dartify(),
  );
  Expect.equals(
    globalContext["a2"].dartify(),
    nan.toJS.and([1, 2].jsify()).dartify(),
  );
  Expect.equals(
    globalContext["n"].dartify(),
    nan.toJS.and(null.jsify()).dartify(),
  );
  Expect.equals(globalContext["n"].dartify(), nan.toJS.and(null).dartify());
  Expect.equals(
    globalContext["b1"].dartify(),
    nan.toJS.and(true.toJS).dartify(),
  );
  Expect.equals(
    globalContext["b2"].dartify(),
    nan.toJS.and(false.toJS).dartify(),
  );
  Expect.equals(
    globalContext["nan"].dartify(),
    nan.toJS.and((0 / 0).toJS).dartify(),
  );
  Expect.equals(
    globalContext["f"].dartify(),
    nan.toJS.and(globalContext["foo"]).dartify(),
  );
  var dartObj = {"id": "I am an object in Dart"};
  Expect.isTrue((nan.toJS.and(dartObj.jsify()).dartify() as num).isNaN);
}
