// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean lessThanOrEqualTo( JSAny? any )
/// The result of `this <= any` in JavaScript.
///
/// @description Check that `lessThanOrEqualTo` returns result of
/// `this <= any` in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testLessThanOrEqualTo(JSAny? underTest) {
  eval(r'''
    var ltNum = underTest <= 2;
    var ltString = underTest <= "text";
    var ltNull = underTest <= null;
    var ltNaN = underTest <= (0 / 0);
    var ltArray = underTest <= [1, 2];
    var ltTrue = underTest <= true;
  ''');

  jsExpectEquals(globalContext["ltNum"], underTest.lessThanOrEqualTo(2.toJS));
  jsExpectEquals(
    globalContext["ltString"],
    underTest.lessThanOrEqualTo("text".toJS),
  );
  jsExpectEquals(globalContext["ltNull"], underTest.lessThanOrEqualTo(null));
  jsExpectEquals(
    globalContext["ltNaN"],
    underTest.lessThanOrEqualTo((0 / 0).toJS),
  );
  jsExpectEquals(
    globalContext["ltArray"],
    underTest.lessThanOrEqualTo([1, 2].jsify()),
  );
  jsExpectEquals(
    globalContext["ltTrue"],
    underTest.lessThanOrEqualTo(true.toJS),
  );
}

main() {
  eval("globalThis.underTest = 42;");
  testLessThanOrEqualTo(42.toJS);

  eval("globalThis.underTest = 2;");
  testLessThanOrEqualTo(2.toJS);

  eval("globalThis.underTest = 1;");
  testLessThanOrEqualTo(1.toJS);

  eval("globalThis.underTest = 'Some text';");
  testLessThanOrEqualTo('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testLessThanOrEqualTo(null);

  eval("globalThis.underTest = 0 / 0;");
  testLessThanOrEqualTo((0 / 0).jsify());

  eval("globalThis.underTest = [0];");
  testLessThanOrEqualTo([].jsify());

  eval("globalThis.underTest = false;");
  testLessThanOrEqualTo(false.toJS);

  eval("globalThis.underTest = {};");
  testLessThanOrEqualTo(JSObject());
}
