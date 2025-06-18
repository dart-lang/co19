// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny subtract( JSAny? any )
/// The result of `this - any` in JavaScript.
///
/// @description Check that `subtract` returns result of `this - any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testSubtract(JSAny? underTest) {
  eval(r'''
    globalThis.subNum = underTest - 2; 
    globalThis.subString = underTest - "text";
    globalThis.subNull = underTest - null;
    globalThis.subNaN = underTest - (0 / 0);
    globalThis.subArray = underTest - [1, 2];
    globalThis.subTrue = underTest - true;
  ''');

  jsExpectEquals(globalContext["subNum"], underTest.subtract(2.toJS));
  jsExpectEquals(globalContext["subString"], underTest.subtract("text".toJS));
  jsExpectEquals(globalContext["subNull"], underTest.subtract(null));
  jsExpectEquals(globalContext["subNaN"], underTest.subtract((0 / 0).toJS));
  jsExpectEquals(globalContext["subArray"], underTest.subtract([1, 2].jsify()));
  jsExpectEquals(globalContext["subTrue"], underTest.subtract(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testSubtract(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testSubtract('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testSubtract(null);

  eval("globalThis.underTest = 0 / 0;");
  testSubtract((0 / 0).toJS);

  eval("globalThis.underTest = [];");
  testSubtract(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testSubtract(false.toJS);

  eval("globalThis.underTest = {};");
  testSubtract(JSObject());
}
