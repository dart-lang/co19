/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is compile time error if an actual argument to the prefix 
 * combinator denotes a name that is declared by the importing library.
 * @description Checks that it is a compile-time error if prefix value duplicates
 * a type variable name.
 * @compile-error
 * @author iefremov
 * @reviewer kaigorodov
 * @needsreview issues 3340, 3481
 */

#import("2_Imports_lib.dart", prefix: "prefix");

class C<prefix> {
  prefix p;
  C(prefix this.p) {
    Expect.equals(1, p);
  }
}

main() {
  try {
    new C<int>(1);
  } catch (var ok) {}
}
