// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean notEquals( JSAny? any )
/// The result of `this != any` in JavaScript.
///
/// @description Check that `notEquals` returns result of `this != any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testNotEquals(JSAny? underTest) {
  eval(r'''
    var neNum = underTest != 2; 
    var neString = underTest != "text";
    var neNull = underTest != null;
    var neUndefined = underTest != undefined;
    var neNaN = underTest != (0 / 0);
    var neArray = underTest != [1, 2];
    var neTrue = underTest != true;
  ''');

  jsExpectEquals(globalContext["neNum"], underTest.notEquals(2.toJS));
  jsExpectEquals(globalContext["neString"], underTest.notEquals("text".toJS));
  jsExpectEquals(globalContext["neNull"], underTest.notEquals(null));
  jsExpectEquals(globalContext["neUndefined"], underTest.notEquals(null));
  jsExpectEquals(globalContext["neNaN"], underTest.notEquals((0 / 0).toJS));
  jsExpectEquals(globalContext["neArray"], underTest.notEquals([1, 2].jsify()));
  jsExpectEquals(globalContext["neTrue"], underTest.notEquals(true.toJS));
}

main() {
  eval("globalThis.underTest = 2;");
  testNotEquals(2.toJS);

  eval("globalThis.underTest = 42;");
  testNotEquals(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testNotEquals('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testNotEquals(null);

  eval("globalThis.underTest = undefined;");
  testNotEquals(null);

  eval("globalThis.underTest = 0 / 0;");
  testNotEquals((0 / 0).jsify());

  eval("globalThis.underTest = [0];");
  testNotEquals([].jsify());

  eval("globalThis.underTest = false;");
  testNotEquals(false.toJS);

  eval("globalThis.underTest = {};");
  testNotEquals(JSObject());
}
