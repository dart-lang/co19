// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a function as `any`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function foo() {}
  ''');
  var f = globalContext["foo"];

  // We cannot rely on the string representation of a JS function.
  // Therefore let's check the beginning of the string only.

  // String "[object Object]function foo() {}
  Expect.isTrue("${JSObject().add(f)}".startsWith("${JSObject()}"));

  // String "42function foo() {}"
  Expect.isTrue("${42.toJS.add(f)}".startsWith("42"));

  // String "xxxfunction foo() {}"
  Expect.isTrue("${"xxx".toJS.add(f)}".startsWith("xxx"));

  // String "1,2function foo() {}"
  Expect.isTrue("${[1, 2].jsify().add(f)}".startsWith("1,2"));

  // String "nullfunction foo() {}"
  Expect.isTrue("${null.jsify().add(f)}".startsWith("null"));
  Expect.isTrue("${null.add(f)}".startsWith("null"));

  // String "truefunction foo() {}"
  Expect.isTrue("${true.toJS.add(f)}".startsWith("true"));

  // String "falsefunction foo() {}"
  Expect.isTrue("${false.toJS.add(f)}".startsWith("false"));

  // String "function foo() {}function foo() {}"
  Expect.isTrue("${f.add(f)}".startsWith("${"".toJS.add(f)}"));
}
