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
    var underTest = foo;
    
    var andNum = underTest && 2;               // 2
    var andStringNum = underTest && "2";       // 2
    var andStringText = underTest && "text";   // "text"
    var andNull = underTest && null;           // null
    var andZero = underTest && 0;              // 0
    var andNaN = underTest && (0 / 0);         // NaN
    var andArrayEmpty = underTest && [];       // []
    var andArrayNum = underTest && [1, 2];     // [1,2]
    var andTrue = underTest && true;           // true
    var andFalse = underTest && false;         // false
    var andFunction = underTest && foo;        // foo() {}
  ''');
  var underTest = globalContext["foo"];

  Expect.equals(
    globalContext["andNum"].dartify(),
    underTest.and(2.toJS).dartify(),
  );
  Expect.equals(
    globalContext["andStringNum"].dartify(),
    underTest.and("2".toJS).dartify(),
  );
  Expect.equals(
    globalContext["andStringText"].dartify(),
    underTest.and("text".toJS).dartify(),
  );
  Expect.equals(
    globalContext["andNull"].dartify(),
    underTest.and(null.jsify()).dartify(),
  );
  Expect.equals(
    globalContext["andNull"].dartify(),
    underTest.and(null).dartify(),
  );
  Expect.equals(
    globalContext["andZero"].dartify(),
    underTest.and(0.toJS).dartify(),
  );
  Expect.equals(
    globalContext["andNaN"].dartify(),
    underTest.and((0 / 0).toJS).dartify(),
  );
  Expect.listEquals(
    globalContext["andArrayEmpty"].dartify(),
    underTest.and([].jsify()).dartify(),
  );
  Expect.listEquals(
    globalContext["andArrayNum"].dartify(),
    underTest.and([1, 2].jsify()).dartify(),
  );
  Expect.equals(
    globalContext["andTrue"].dartify(),
    underTest.and(true.toJS).dartify(),
  );
  Expect.equals(
    globalContext["andFalse"].dartify(),
    underTest.and(false.toJS).dartify(),
  );
  Expect.equals(
    globalContext["andFunction"].dartify(),
    underTest.and(globalContext["foo"]).dartify(),
  );
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(
    "I am an object in Dart",
    (underTest.and(dartObj.jsify()).dartify() as Map)["id"],
  );
}
