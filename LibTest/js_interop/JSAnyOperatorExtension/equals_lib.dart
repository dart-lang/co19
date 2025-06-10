// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean equals( JSAny? any )
/// The result of `this == other` in JavaScript.
///
/// @description Check that `equals` returns result of `this == other` in
/// JavaScript
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

void testEquals(JSAny? underTest, String strObj) {
  eval("var underTest = $strObj;");
  eval(r'''
    function foo() {}
    
    var eqZero = underTest == 0;
    var eqNum = underTest == 2; 
    var eqFloat = underTest == 3.14;
    var eqStringNum = underTest == "2";
    var eqStringEmpty = underTest == "";
    var eqStringText = underTest == "text";
    var eqNull = underTest == null;
    var eqNaN = underTest == (0 / 0);
    var eqArrayEmpty = underTest == [];
    var eqArrayNum = underTest == [1, 2];
    var eqTrue = underTest == true;
    var eqFalse = underTest == false;
    var eqObject = underTest == {};
    var eqFunction = underTest == foo;
  ''');

  Expect.equals(globalContext["eqZero"], underTest.equals(0.toJS));
  Expect.equals(globalContext["eqNum"], underTest.equals(2.toJS));
  Expect.equals(globalContext["eqFloat"], underTest.equals(3.14.toJS));
  Expect.equals(globalContext["eqStringNum"], underTest.equals("2".toJS));
  Expect.equals(globalContext["eqStringEmpty"], underTest.equals("".toJS));
  Expect.equals(globalContext["eqStringText"], underTest.equals("text".toJS));
  Expect.equals(globalContext["eqNull"], underTest.equals(null.jsify()));
  Expect.equals(globalContext["eqNull"], underTest.equals(null));
  Expect.equals(globalContext["eqNaN"], underTest.equals((0 / 0).jsify()));
  Expect.equals(globalContext["eqArrayEmpty"], underTest.equals([].jsify()));
  Expect.equals(globalContext["eqArrayNum"], underTest.equals([1, 2].jsify()));
  Expect.equals(globalContext["eqTrue"], underTest.equals(true.toJS));
  Expect.equals(globalContext["eqFalse"], underTest.equals(false.toJS));
  Expect.equals(globalContext["eqObject"], underTest.equals(JSObject()));
  Expect.equals(
    globalContext["eqFunction"],
    underTest.equals(globalContext["foo"]),
  );
}
