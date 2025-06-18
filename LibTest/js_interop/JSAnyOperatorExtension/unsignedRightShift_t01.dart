// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny unsignedRightShift( JSAny? any )
/// The result of `this >>> any` in JavaScript.
///
/// @description Check that `unsignedRightShift` returns result of
/// `this >>> any` in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testUnsignedRightShift(JSAny? underTest) {
  eval(r'''
    globalThis.shNum = underTest >>> 2; 
    globalThis.shString = underTest >>> "text";
    globalThis.shNull = underTest >>> null;
    globalThis.shNaN = underTest >>> (0 / 0);
    globalThis.shArray = underTest >>> [1, 2];
    globalThis.shTrue = underTest >>> true;
  ''');

  jsExpectEquals(globalContext["shNum"], underTest.unsignedRightShift(2.toJS));
  jsExpectEquals(
    globalContext["shString"],
    underTest.unsignedRightShift("text".toJS),
  );
  jsExpectEquals(globalContext["shNull"], underTest.unsignedRightShift(null));
  jsExpectEquals(
    globalContext["shNaN"],
    underTest.unsignedRightShift((0 / 0).toJS),
  );
  jsExpectEquals(
    globalContext["shArray"],
    underTest.unsignedRightShift([1, 2].jsify()),
  );
  jsExpectEquals(
    globalContext["shTrue"],
    underTest.unsignedRightShift(true.toJS),
  );
}

main() {
  eval("globalThis.underTest = 42;");
  testUnsignedRightShift(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testUnsignedRightShift('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testUnsignedRightShift(null);

  eval("globalThis.underTest = 0 / 0;");
  testUnsignedRightShift((0 / 0).toJS);

  eval("globalThis.underTest = [];");
  testUnsignedRightShift(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testUnsignedRightShift(false.toJS);

  eval("globalThis.underTest = {};");
  testUnsignedRightShift(JSObject());
}
