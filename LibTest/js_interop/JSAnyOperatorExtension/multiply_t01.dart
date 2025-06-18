// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny multiply( JSAny? any )
/// The result of `this * any` in JavaScript.
///
/// @description Check that `multiply` returns result of `this * any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testMultiply(JSAny? underTest) {
  eval(r'''
    globalThis.mlNum = underTest * 2; 
    globalThis.mlString = underTest * "text";
    globalThis.mlNull = underTest * null;
    globalThis.mlNaN = underTest * (0 / 0);
    globalThis.mlArray = underTest * [1, 2];
    globalThis.mlTrue = underTest * true;
  ''');

  jsExpectEquals(globalContext["mlNum"], underTest.multiply(2.toJS));
  jsExpectEquals(globalContext["mlString"], underTest.multiply("text".toJS));
  jsExpectEquals(globalContext["mlNull"], underTest.multiply(null));
  jsExpectEquals(globalContext["mlNaN"], underTest.multiply((0 / 0).toJS));
  jsExpectEquals(globalContext["mlArray"], underTest.multiply([1, 2].jsify()));
  jsExpectEquals(globalContext["mlTrue"], underTest.multiply(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testMultiply(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testMultiply('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testMultiply(null);

  eval("globalThis.underTest = 0 / 0;");
  testMultiply((0 / 0).toJS);

  eval("globalThis.underTest = [0];");
  testMultiply(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testMultiply(false.toJS);

  eval("globalThis.underTest = {};");
  testMultiply(JSObject());
}
