// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean greaterThanOrEqualTo( JSAny? any )
/// The result of `this >= any` in JavaScript.
///
/// @description Check that `greaterThanOrEqualTo` returns result of
/// `this >= any` in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testGreaterThanOrEqualTo(JSAny? underTest) {
  eval(r'''
    globalThis.gtNum = underTest >= 2;
    globalThis.gtString = underTest >= "text";
    globalThis.gtNull = underTest >= null;
    globalThis.gtNaN = underTest >= (0 / 0);
    globalThis.gtArray = underTest >= [1, 2];
    globalThis.gtTrue = underTest >= true;
  ''');

  jsExpectEquals(
    globalContext["gtNum"],
    underTest.greaterThanOrEqualTo(2.toJS),
  );
  jsExpectEquals(
    globalContext["gtString"],
    underTest.greaterThanOrEqualTo("text".toJS),
  );
  jsExpectEquals(globalContext["gtNull"], underTest.greaterThanOrEqualTo(null));
  jsExpectEquals(
    globalContext["gtNaN"],
    underTest.greaterThanOrEqualTo((0 / 0).toJS),
  );
  jsExpectEquals(
    globalContext["gtArray"],
    underTest.greaterThanOrEqualTo([1, 2].jsify()),
  );
  jsExpectEquals(
    globalContext["gtTrue"],
    underTest.greaterThanOrEqualTo(true.toJS),
  );
}

main() {
  eval("globalThis.underTest = 42;");
  testGreaterThanOrEqualTo(42.toJS);

  eval("globalThis.underTest = 2;");
  testGreaterThanOrEqualTo(2.toJS);

  eval("globalThis.underTest = 1;");
  testGreaterThanOrEqualTo(1.toJS);

  eval("globalThis.underTest = 'Some text';");
  testGreaterThanOrEqualTo('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testGreaterThanOrEqualTo(null);

  eval("globalThis.underTest = 0 / 0;");
  testGreaterThanOrEqualTo((0 / 0).toJS);

  eval("globalThis.underTest = [0];");
  testGreaterThanOrEqualTo(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testGreaterThanOrEqualTo(false.toJS);

  eval("globalThis.underTest = {};");
  testGreaterThanOrEqualTo(JSObject());
}
