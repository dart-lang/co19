// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type test, o is U or o is! U, and a type cast, o as U, where U
/// is or contains an inline type, is performed at run time as a type test and
/// type cast on the run-time representation of the inline type
///
/// @description Check that at run time a type test, `o is U` or `o is! U` is
/// performed as a type test on the run-time representation of the inline type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V {
  final int id;
  V(this.id);
}

main() {
  var v = V(42);
  Expect.isTrue(v is V);
  Expect.isFalse(v is! V);
  Expect.isTrue(v is int);
  Expect.isFalse(v is! int);
  Expect.isFalse(v is String);

  int i = 0;
  Expect.isTrue(i is V);
  Expect.isFalse(i is! V);
}
