/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let c1 and c2 be a pair of constants. Then identical(c1, c2) iff:
 * - c1 evaluates to either null, a constant map, an constant list, an instance
 *   of bool, num, String or Type and c1 == c2 , OR
 * - c1 and c2 are constant objects of the same class C and for each member
 *   ﬁeld of c1 is identical to the corresponding ﬁeld of c2 .
 * where identical() is the predeﬁned dart function that returns true iff its two
 * arguments are the same object.
 * @description Provides examples to the contrary
 * @needsreview issues 2506, 3294
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  final x;
  const C(this.x);
  bool operator == (C other) {
    return this.x != other.x;
  }
}

main() {
  Expect.isFalse(const C(1) == const C(1));
  Expect.isTrue(identical(const C(1), const C(1)));

  Expect.isTrue(const C(1) == const C(2));
  Expect.isFalse(identical(const C(1), const C(2)));
  
  Expect.isFalse(double.NAN == double.NAN);
  Expect.isTrue(identical(double.NAN, double.NAN));
}
