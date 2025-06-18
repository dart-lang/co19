// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean strictEquals( JSAny? any )
/// The result of `this === any` in JavaScript.
///
/// @description Check that `strictEquals` returns result of `this === any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

testStrictEquals(JSAny? underTest) {
  eval(r'''
    globalThis.eqNum = underTest === 2; 
    globalThis.eqString = underTest === "text";
    globalThis.eqNull = underTest === null;
    globalThis.eqUndefined = underTest === undefined;
    globalThis.eqNaN = underTest === (0 / 0);
    globalThis.eqArray = underTest === [1, 2];
    globalThis.eqTrue = underTest === true;
  ''');

  jsExpectEquals(globalContext["eqNum"], underTest.strictEquals(2.toJS));
  jsExpectEquals(
    globalContext["eqString"],
    underTest.strictEquals("text".toJS),
  );
  jsExpectEquals(globalContext["eqNaN"], underTest.strictEquals((0 / 0).toJS));
  jsExpectEquals(
    globalContext["eqArray"],
    underTest.strictEquals([1, 2].jsify()),
  );
  jsExpectEquals(globalContext["eqTrue"], underTest.strictEquals(true.toJS));

  if (isJS) {
    jsExpectEquals(
      globalContext["eqUndefined"],
      underTest.strictEquals(undefined),
    );
    jsExpectEquals(globalContext["eqNull"], underTest.strictEquals(null));
  }
  if (isWasm && underTest == null) {
    jsExpectEquals(true.toJS, underTest.strictEquals(null));
    jsExpectEquals(true.toJS, underTest.strictEquals(undefined));
  }
}

var undefined = globalContext["undefined"];

main() {
  eval("globalThis.underTest = 2;");
  testStrictEquals(2.toJS);

  eval("globalThis.underTest = 42;");
  testStrictEquals(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testStrictEquals('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testStrictEquals(null);

  eval("globalThis.underTest = undefined;");
  testStrictEquals(undefined);

  eval("globalThis.underTest = 0 / 0;");
  testStrictEquals((0 / 0).toJS);

  eval("globalThis.underTest = [0];");
  testStrictEquals(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testStrictEquals(false.toJS);

  eval("globalThis.underTest = {};");
  testStrictEquals(JSObject());
}
