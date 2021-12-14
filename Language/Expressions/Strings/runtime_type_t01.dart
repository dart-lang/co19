// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Invoking the getter runtimeType on a string literal returns the
/// Type object that is the value of the expression String.
/// @description Checks that invoking the getter runtimeType on a string literal
/// returns the Type object that is the value of the expression String.
/// @author ngl@unipro.ru

import '../../../Utils/expect.dart';

main() {
  checkType(checkIs<Type>, true, "abc".runtimeType);
  Expect.isTrue("abc".runtimeType == String);
  checkType(checkIs<Type>, true, 'abc'.runtimeType);
  Expect.isTrue('abc'.runtimeType == String);
  checkType(checkIs<Type>, true, r"abc".runtimeType);
  Expect.isTrue(r"abc".runtimeType == String);
  checkType(checkIs<Type>, true, r'abc'.runtimeType);
  Expect.isTrue(r'abc'.runtimeType == String);
}
