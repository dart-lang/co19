// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean lessThan( JSAny? any )
/// The result of `this < any` in JavaScript.
///
/// @description Check that `lessThan` returns result of `this < any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testLessThan(JSAny? underTest) {
  eval(r'''
    var ltNum = underTest < 2;
    var ltString = underTest < "text";
    var ltNull = underTest < null;
    var ltNaN = underTest < (0 / 0);
    var ltArray = underTest < [1, 2];
    var ltTrue = underTest < true;
  ''');

  jsExpectEquals(globalContext["ltNum"], underTest.lessThan(2.toJS));
  jsExpectEquals(globalContext["ltString"], underTest.lessThan("text".toJS));
  jsExpectEquals(globalContext["ltNull"], underTest.lessThan(null));
  jsExpectEquals(globalContext["ltNaN"], underTest.lessThan((0 / 0).toJS));
  jsExpectEquals(globalContext["ltArray"], underTest.lessThan([1, 2].jsify()));
  jsExpectEquals(globalContext["ltTrue"], underTest.lessThan(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testLessThan(42.toJS);

  eval("globalThis.underTest = 2;");
  testLessThan(2.toJS);

  eval("globalThis.underTest = 1;");
  testLessThan(1.toJS);

  eval("globalThis.underTest = 'Some text';");
  testLessThan('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testLessThan(null);

  eval("globalThis.underTest = 0 / 0;");
  testLessThan((0 / 0).jsify());

  eval("globalThis.underTest = [0];");
  testLessThan([].jsify());

  eval("globalThis.underTest = false;");
  testLessThan(false.toJS);

  eval("globalThis.underTest = {};");
  testLessThan(JSObject());
}
