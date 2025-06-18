// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testAdd(JSAny? underTest) {
  eval(r'''
    globalThis.addNum = underTest + 2; 
    globalThis.addString = underTest + "text";
    globalThis.addNull = underTest + null;
    globalThis.addNaN = underTest + (0 / 0);
    globalThis.addArray = underTest + [1, 2];
    globalThis.addTrue = underTest + true;
  ''');

  jsExpectEquals(globalContext["addNum"], underTest.add(2.toJS));
  jsExpectEquals(globalContext["addString"], underTest.add("text".toJS));
  jsExpectEquals(globalContext["addNull"], underTest.add(null));
  jsExpectEquals(globalContext["addNaN"], underTest.add((0 / 0).toJS));
  jsExpectEquals(globalContext["addArray"], underTest.add([1, 2].jsify()));
  jsExpectEquals(globalContext["addTrue"], underTest.add(true.toJS));
}

main() {
  eval("globalThis.underTest = 42;");
  testAdd(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testAdd('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testAdd(null);

  eval("globalThis.underTest = 0 / 0;");
  testAdd((0 / 0).jsify());

  eval("globalThis.underTest = [];");
  testAdd([].jsify());

  eval("globalThis.underTest = false;");
  testAdd(false.toJS);

  eval("globalThis.underTest = {};");
  testAdd(JSObject());
}
