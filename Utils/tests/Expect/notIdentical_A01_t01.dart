// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void notIdentical(
///    var expected, var actual, [String reason = ''])
/// Checks whether the expected and actual values are not identical.
///
/// @description Checks that no exception is thrown when the arguments are not
/// identical.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class C {
  final value;
  const C(this.value);
}

main() {
  Expect.notIdentical("x", String.fromCharCode("x".codeUnitAt(0)));
  Expect.notIdentical(Object(), Object());
  Expect.notIdentical(Object(), const Object());
  Expect.notIdentical(C(42), C(42));
  Expect.notIdentical(C(42), const C(42));
}
