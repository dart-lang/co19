// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean equals( JSAny? any )
/// The result of `this == other` in JavaScript.
///
/// @description Check that `equals` returns result of `this == other` in
/// JavaScript. Test a non-empty string  as `this`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';
import 'equals_lib.dart';

void main() {
  var underTest = "text".toJS;
  testEquals(underTest, "'text'");
  Expect.isTrue(underTest.equals(underTest).dartify());
}
