// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test `null` as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(JSAny? n) {
  eval(r'''
    function foo() {}
    
    var o = null;
    var one = o && 1;         // null
    var string = o && "s";    // null
    var a1 = o && [];         // null
    var a2 = o && [1, 2];     // null
    var n = o && null;        // null
    var b1 = o && true;       // null
    var b2 = o && false;      // null
    var nan = o && (0 / 0);   // null
    var f = o && foo;         // null
  ''');

  Expect.equals(globalContext["one"], n.and(1.toJS));
  Expect.equals(globalContext["string"], n.and("s".toJS));
  Expect.equals(globalContext["a1"], n.and([].jsify()));
  Expect.equals(globalContext["a2"], n.and([1, 2].jsify()));
  Expect.equals(globalContext["n"], n.and(null.jsify()));
  Expect.equals(globalContext["n"], n.and(null));
  Expect.equals(globalContext["b1"], n.and(true.toJS));
  Expect.equals(globalContext["b2"], n.and(false.toJS));
  Expect.equals(
    globalContext["nan"].dartify(),
    n.and((0 / 0).toJS).dartify(),
  );
  Expect.equals(globalContext["f"], n.and(globalContext["foo"]));
  var dartObj = {"id": "I am an object in Dart"};
  Expect.isNull(n.and(dartObj.jsify()).dartify());
}

main() {
  test(null);
  test(null.jsify());
}
