// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean strictNotEquals( JSAny? any )
/// The result of `this !== any` in JavaScript.
///
/// @description Check that `strictNotEquals` returns result of `this !== any`
/// in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

testStrictNotEquals(JSAny? underTest) {
  eval(r'''
    var neNum = underTest !== 2; 
    var neString = underTest !== "text";
    var neNull = underTest !== null;
    var neUndefined = underTest !== undefined;
    var neNaN = underTest !== (0 / 0);
    var neArray = underTest !== [1, 2];
    var neTrue = underTest !== true;
  ''');

  jsExpectEquals(globalContext["neNum"], underTest.strictNotEquals(2.toJS));
  jsExpectEquals(
    globalContext["neString"],
    underTest.strictNotEquals("text".toJS),
  );
  jsExpectEquals(
    globalContext["neNaN"],
    underTest.strictNotEquals((0 / 0).toJS),
  );
  jsExpectEquals(
    globalContext["neArray"],
    underTest.strictNotEquals([1, 2].jsify()),
  );
  jsExpectEquals(globalContext["neTrue"], underTest.strictNotEquals(true.toJS));

  if (isJS) {
    jsExpectEquals(
      globalContext["neUndefined"],
      underTest.strictNotEquals(undefined),
    );
    jsExpectEquals(globalContext["neNull"], underTest.strictNotEquals(null));
  }
  if (isWasm && underTest == null) {
    jsExpectEquals(false.toJS, underTest.strictNotEquals(null));
    jsExpectEquals(false.toJS, underTest.strictNotEquals(undefined));
  }
}

var undefined = globalContext["undefined"];

main() {
  eval("globalThis.underTest = 2;");
  testStrictNotEquals(2.toJS);

  eval("globalThis.underTest = 42;");
  testStrictNotEquals(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testStrictNotEquals('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testStrictNotEquals(null);

  eval("globalThis.underTest = undefined;");
  testStrictNotEquals(undefined);

  eval("globalThis.underTest = 0 / 0;");
  testStrictNotEquals((0 / 0).jsify());

  eval("globalThis.underTest = [0];");
  testStrictNotEquals([].jsify());

  eval("globalThis.underTest = false;");
  testStrictNotEquals(false.toJS);

  eval("globalThis.underTest = {};");
  testStrictNotEquals(JSObject());
}
