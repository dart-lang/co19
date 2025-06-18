// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny and( JSAny? any )
/// The result of `this && any` in JavaScript.
///
/// @description Check that `and` returns result of `this && any` in JavaScript.
/// Test not 'truthy' first operand.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testAnd(JSAny? underTest) {
  eval(r'''
    globalThis.andNum = underTest && 2; 
    globalThis.andString = underTest && "text";
    globalThis.andNull = underTest && null;
    globalThis.andNaN = underTest && (0 / 0);
    globalThis.andArray = underTest && [1, 2];
    globalThis.andTrue = underTest && true;
  ''');

  jsExpectEquals(globalContext["andNum"], underTest.and(2.toJS));
  jsExpectEquals(globalContext["andString"], underTest.and("text".toJS));
  jsExpectEquals(globalContext["andNull"], underTest.and(null));
  jsExpectEquals(globalContext["andNaN"], underTest.and((0 / 0).toJS));
  jsExpectEquals(globalContext["andArray"], underTest.and([1, 2].jsify()));
  jsExpectEquals(globalContext["andTrue"], underTest.and(true.toJS));
}

main() {
  eval("globalThis.underTest = 0;");
  testAnd(0.toJS);

  eval("globalThis.underTest = '';");
  testAnd(''.toJS);

  eval("globalThis.underTest = null;");
  testAnd(null);

  eval("globalThis.underTest = 0 / 0;");
  testAnd((0 / 0).toJS);

  eval("globalThis.underTest = false;");
  testAnd(false.toJS);
}
