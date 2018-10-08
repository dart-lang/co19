/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 *  • c1 and c2 are constant objects of the same class C and each member field
 *    of c1 is identical to the corresponding field of c2.
 * @description Checks that identical() works as described even if the classes
 * being compared have operator == redefined to return counter-intuitive result.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

class C {
  final x;
  const C(this.x);
  bool operator ==(Object other) {
    if (other is C) {
      return this.x != other.x;
    }
    return true;
  }
}

main() {
  Expect.isFalse(const C(1) == const C(1));
  Expect.isTrue(identical(const C(1), const C(1)));

  Expect.isTrue(const C(1) == const C(2));
  Expect.isFalse(identical(const C(1), const C(2)));

  Expect.isFalse(double.nan == double.nan);
  Expect.isTrue(identical(double.nan, double.nan));
}
