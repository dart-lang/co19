// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean equals( JSAny? any )
/// The result of `this == other` in JavaScript.
///
/// @description Check that `equals` returns result of `this == other` in
/// JavaScript. Test a function as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import 'equals_lib.dart';
import '../js_utils.dart';

void main() {
  eval(r'''
    function bar() {}
  ''');

  var underTest = globalContext["bar"].jsify();
  testEquals(underTest, "bar");
  Expect.isTrue(underTest.equals(underTest).dartify());
}
