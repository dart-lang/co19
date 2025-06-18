// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny exponentiate( JSAny? any )
/// The result of `this ** any` in JavaScript.
///
/// @description Check that `exponentiate` returns result of `this ** any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testExponentiate(JSAny? underTest) {
  eval(r'''
    globalThis.expNum = underTest ** 2; 
    globalThis.expString = underTest ** "text";
    globalThis.expNull = underTest ** null;
    globalThis.expNaN = underTest ** (0 / 0);
    globalThis.expArray = underTest ** [1, 2];
    globalThis.expTrue = underTest ** true;
  ''');

  jsExpectEquals(globalContext["expNum"], underTest.exponentiate(2.toJS));
  jsExpectEquals(
    globalContext["expString"],
    underTest.exponentiate("text".toJS),
  );
  jsExpectEquals(globalContext["expNull"], underTest.exponentiate(null));
  jsExpectEquals(globalContext["expNaN"], underTest.exponentiate((0 / 0).toJS));
  jsExpectEquals(
    globalContext["expArray"],
    underTest.exponentiate([1, 2].jsify()),
  );
  jsExpectEquals(globalContext["expTrue"], underTest.exponentiate(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testExponentiate(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testExponentiate('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testExponentiate(null);

  eval("globalThis.underTest = 0 / 0;");
  testExponentiate((0 / 0).toJS);

  eval("globalThis.underTest = [0];");
  testExponentiate(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testExponentiate(false.toJS);

  eval("globalThis.underTest = {};");
  testExponentiate(JSObject());
}
