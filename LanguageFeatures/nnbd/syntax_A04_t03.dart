// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The modifier late is added as a built-in identifier. The grammar
/// of top level variables, static fields, instance fields, and local variables
/// is extended to allow any declaration to include the modifier late.
///
/// @description Checks that the 'late' word can be used as a variable name
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

double late = 3.14;

test () {
  double late = -3.14;
  Expect.equals(-3.14, late);
}

main() {
  Expect.equals(3.14, late);
  test();
}
