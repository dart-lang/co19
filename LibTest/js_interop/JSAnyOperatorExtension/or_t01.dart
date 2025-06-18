// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny or( JSAny? any )
/// The result of `this || any` in JavaScript.
///
/// @description Check that `or` returns result of `this || any` in JavaScript.
/// Test 'truthy' first operand.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testOr(JSAny? underTest) {
  eval(r'''
    globalThis.orNum = underTest || 2; 
    globalThis.orString = underTest || "text";
    globalThis.orNull = underTest || null;
    globalThis.orNaN = underTest || (0 / 0);
    globalThis.orArray = underTest || [1, 2];
    globalThis.orTrue = underTest || true;
  ''');

  if (underTest.isA<JSArray>()) {
    jsExpectArrayEquals(globalContext["orNum"], underTest.or(2.toJS));
    jsExpectArrayEquals(globalContext["orString"], underTest.or("text".toJS));
    jsExpectArrayEquals(globalContext["orNull"], underTest.or(null));
    jsExpectArrayEquals(globalContext["orNaN"], underTest.or((0 / 0).toJS));
    jsExpectArrayEquals(globalContext["orArray"], underTest.or([1, 2].jsify()));
    jsExpectArrayEquals(globalContext["orTrue"], underTest.or(true.toJS));
  } else {
    jsExpectEquals(globalContext["orNum"], underTest.or(2.toJS));
    jsExpectEquals(globalContext["orString"], underTest.or("text".toJS));
    jsExpectEquals(globalContext["orNull"], underTest.or(null));
    jsExpectEquals(globalContext["orNaN"], underTest.or((0 / 0).toJS));
    jsExpectEquals(globalContext["orArray"], underTest.or([1, 2].jsify()));
    jsExpectEquals(globalContext["orTrue"], underTest.or(true.toJS));
  }

}

main() {
  eval("globalThis.underTest = 42;");
  testOr(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testOr('Some text'.toJS);

  eval("globalThis.underTest = [];");
  testOr(<JSAny?>[].toJS);

  eval("globalThis.underTest = true;");
  testOr(true.toJS);
}
