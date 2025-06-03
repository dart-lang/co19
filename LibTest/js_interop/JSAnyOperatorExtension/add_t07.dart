// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny add( JSAny? any )
/// The result of `this + any` in JavaScript.
///
/// @description Check that `add` returns result of `this + any` in JavaScript.
/// Test a function as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

void foo() {}

main() {
  var f = foo.jsify();

  // We cannot rely on the string representation of a Dart function.
  // Therefore let's check the end of the string only.

  // String "function() {}1"
  Expect.isTrue("${f.add(1.toJS)}".endsWith("1"));

  // String "function() {}s"
  Expect.isTrue("${f.add("s".toJS)}".endsWith("s"));

  // String "function() {}1,2"
  Expect.isTrue("${f.add([1, 2].jsify())}".endsWith("1,2"));

  // String "function() {}[object Object]"
  Expect.isTrue("${f.add(JSObject())}".endsWith("${JSObject()}"));

  // String "function() {}[object Object]"
  Expect.isTrue("${f.add({"a": "b"}.jsify())}".endsWith("${JSObject()}"));

  // String "function() {}null"
  Expect.isTrue("${f.add(null.jsify())}".endsWith("null"));
  Expect.isTrue("${f.add(null)}".endsWith("null"));

  // String "function() {}true"
  Expect.isTrue("${f.add(true.toJS)}".endsWith("true"));

  // String "function() {}false"
  Expect.isTrue("${f.add(false.toJS)}".endsWith("false"));
}
