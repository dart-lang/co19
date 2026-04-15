// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the name of a named optional
/// parameter begins with an `_` character.
///
/// @description Checks that there is no compile-time error to call a function
/// with the name of a named optional parameter starting with `_`.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

void f1({int p = 0}) {}

main() {
  dynamic d = f1;
  Expect.throws(() {
    d(_: 42);
  });
  Expect.throws(() {
    d(_p: 42);
  });
}
