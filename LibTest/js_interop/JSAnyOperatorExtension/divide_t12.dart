// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? divide( JSAny? other )
/// The result of `this / other` in JavaScript.
///
/// @description Check that `divide` returns result of `this / other` in
/// JavaScript. Test a function as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

void main() {
  eval(r'''
    function foo() {}
    var underTest = foo;
    
    var divNum = underTest / 2;              // NaN
    var divStringNum = underTest / "2";      // NaN
    var divStringText = underTest / "text";  // NaN
    var divNull = underTest / null;          // NaN
    var divZero = underTest / 0;             // NaN
    var divNaN = underTest / (0 / 0);        // NaN
    var divArrayEmpty = underTest / [];      // NaN
    var divArrayNum = underTest / [1, 2];    // NaN
    var divTrue = underTest / true;          // NaN
    var divFalse = underTest / false;        // NaN
    var divObject = underTest / {};          // NaN
    var divFunction = underTest / foo;       // NaN
  ''');
  var underTest = globalContext["foo"];

  Expect.equals(
    globalContext["divNum"].dartify(),
    underTest.divide(2.toJS).dartify(),
  );
  Expect.equals(
    globalContext["divStringNum"].dartify(),
    underTest.divide("2".toJS).dartify(),
  );
  Expect.equals(
    globalContext["divStringText"].dartify(),
    underTest.divide("text".toJS).dartify(),
  );
  Expect.equals(
    globalContext["divNull"].dartify(),
    underTest.divide(null.jsify()).dartify(),
  );
  Expect.equals(
    globalContext["divNull"].dartify(),
    underTest.divide(null).dartify(),
  );
  Expect.equals(
    globalContext["divZero"].dartify(),
    underTest.divide(0.toJS).dartify(),
  );
  Expect.equals(
    globalContext["divNaN"].dartify(),
    underTest.divide((0 / 0).toJS).dartify(),
  );
  Expect.equals(
    globalContext["divArrayEmpty"].dartify(),
    underTest.divide([].jsify()).dartify(),
  );
  Expect.equals(
    globalContext["divArrayNum"].dartify(),
    underTest.divide([1, 2].jsify()).dartify(),
  );
  Expect.equals(
    globalContext["divTrue"].dartify(),
    underTest.divide(true.toJS).dartify(),
  );
  Expect.equals(
    globalContext["divFalse"].dartify(),
    underTest.divide(false.toJS).dartify(),
  );
  Expect.equals(
    globalContext["divObject"].dartify(),
    underTest.divide(JSObject()).dartify(),
  );
  Expect.equals(
    globalContext["divFunction"].dartify(),
    underTest.divide(globalContext["foo"]).dartify(),
  );
  var dartObj = {"id": "I am an object in Dart"};
  Expect.equals(
    globalContext["divObject"].dartify(),
    underTest.divide(dartObj.jsify()).dartify(),
  );
}
