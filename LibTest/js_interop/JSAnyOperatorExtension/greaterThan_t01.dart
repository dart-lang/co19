// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean greaterThan( JSAny? any )
/// The result of `this > any` in JavaScript.
///
/// @description Check that `greaterThan` returns result of `this > any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testGreaterThan(JSAny? underTest) {
  eval(r'''
    var gtNum = underTest > 2;
    var gtString = underTest > "text";
    var gtNull = underTest > null;
    var gtNaN = underTest > (0 / 0);
    var gtArray = underTest > [1, 2];
    var gtTrue = underTest > true;
  ''');

  jsExpectEquals(globalContext["gtNum"], underTest.greaterThan(2.toJS));
  jsExpectEquals(globalContext["gtString"], underTest.greaterThan("text".toJS));
  jsExpectEquals(globalContext["gtNull"], underTest.greaterThan(null));
  jsExpectEquals(globalContext["gtNaN"], underTest.greaterThan((0 / 0).toJS));
  jsExpectEquals(
    globalContext["gtArray"],
    underTest.greaterThan([1, 2].jsify()),
  );
  jsExpectEquals(globalContext["gtTrue"], underTest.greaterThan(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testGreaterThan(42.toJS);

  eval("globalThis.underTest = 2;");
  testGreaterThan(2.toJS);

  eval("globalThis.underTest = 1;");
  testGreaterThan(1.toJS);

  eval("globalThis.underTest = 'Some text';");
  testGreaterThan('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testGreaterThan(null);

  eval("globalThis.underTest = 0 / 0;");
  testGreaterThan((0 / 0).jsify());

  eval("globalThis.underTest = [0];");
  testGreaterThan([].jsify());

  eval("globalThis.underTest = false;");
  testGreaterThan(false.toJS);

  eval("globalThis.underTest = {};");
  testGreaterThan(JSObject());
}
