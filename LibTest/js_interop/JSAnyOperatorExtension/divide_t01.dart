// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny divide( JSAny? any )
/// The result of `this / any` in JavaScript.
///
/// @description Check that `divide` returns result of `this / any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testDivide(JSAny? underTest) {
  eval(r'''
    globalThis.divNum = underTest / 2; 
    globalThis.divString = underTest / "text";
    globalThis.divNull = underTest / null;
    globalThis.divNaN = underTest / (0 / 0);
    globalThis.divArray = underTest / [1, 2];
    globalThis.divTrue = underTest / true;
  ''');

  jsExpectEquals(globalContext["divNum"], underTest.divide(2.toJS));
  jsExpectEquals(globalContext["divString"], underTest.divide("text".toJS));
  jsExpectEquals(globalContext["divNull"], underTest.divide(null));
  jsExpectEquals(globalContext["divNaN"], underTest.divide((0 / 0).toJS));
  jsExpectEquals(globalContext["divArray"], underTest.divide([1, 2].jsify()));
  jsExpectEquals(globalContext["divTrue"], underTest.divide(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testDivide(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testDivide('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testDivide(null);

  eval("globalThis.underTest = 0 / 0;");
  testDivide((0 / 0).jsify());

  eval("globalThis.underTest = [0];");
  testDivide([].jsify());

  eval("globalThis.underTest = false;");
  testDivide(false.toJS);

  eval("globalThis.underTest = {};");
  testDivide(JSObject());
}
