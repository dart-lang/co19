// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The predeﬁned Dart function identical() is deﬁned such that
/// identical(c1, c2) iff:
/// . . .
///  • c1 and c2 are instances of double and one of the following holds:
///      – c1 and c2 are non-zero and c1 == c2.
///      – Both c1 and c2 are +0.0.
///      – Both c1 and c2 are −0.0.
///      – Both c1 and c2 represent a NaN value with the same underlying bit
///        pattern.
/// @description Checks that two NaNs are identical.
/// @author kaigorodov
/// @issue 42224

import "../../../Utils/expect.dart";

div(var a, var b) {
  return a / b;
}

var nol = 0.0;

main() {
  double nan1 = div(nol, nol);
  double nan2 = div(nol, nol);
  if (isJS) {
    Expect.isFalse(identical(nan1, nan2));
    Expect.isFalse(identical(double.nan, double.nan));
  } else {
    Expect.isTrue(identical(nan1, nan2));
    Expect.isTrue(identical(double.nan, double.nan));
  }
}
