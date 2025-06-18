// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny modulo( JSAny? any )
/// The result of `this % any` in JavaScript.
///
/// @description Check that `modulo` returns result of `this % any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testModulo(JSAny? underTest) {
  eval(r'''
    globalThis.modNum = underTest % 2; 
    globalThis.modString = underTest % "text";
    globalThis.modNull = underTest % null;
    globalThis.modNaN = underTest % (0 / 0);
    globalThis.modArray = underTest % [1, 2];
    globalThis.modTrue = underTest % true;
  ''');

  jsExpectEquals(globalContext["modNum"], underTest.modulo(2.toJS));
  jsExpectEquals(globalContext["modString"], underTest.modulo("text".toJS));
  jsExpectEquals(globalContext["modNull"], underTest.modulo(null));
  jsExpectEquals(globalContext["modNaN"], underTest.modulo((0 / 0).toJS));
  jsExpectEquals(globalContext["modArray"], underTest.modulo([1, 2].jsify()));
  jsExpectEquals(globalContext["modTrue"], underTest.modulo(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testModulo(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testModulo('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testModulo(null);

  eval("globalThis.underTest = 0 / 0;");
  testModulo((0 / 0).toJS);

  eval("globalThis.underTest = [0];");
  testModulo(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testModulo(false.toJS);

  eval("globalThis.underTest = {};");
  testModulo(JSObject());
}
