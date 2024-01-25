// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive if the set of cases is exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch statement is a sealed class and the set of cases is an
/// exhaustive set of variable patterns with extension types
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

sealed class A {}

class B extends A {}

class C extends A {}

extension type BET1(B _) {}
extension type BET2(B _) implements B {}
extension type CET1(C _) {}
extension type CET2(C _) implements A {} // Let's check implements A, not C

String test1_1(A a) {
  switch (a) {
    case CET1 _: return 'C';
    case BET1 _: return 'B';
  }
}

String test1_2(A a) {
  switch (a) {
    case BET2 _: return 'B';
    case CET2 _: return 'C';
  }
}

String test2_1(A a) {
  switch (a) {
    case BET1 _: return 'B';
    case CET1 _: return 'C';
  }
}

String test2_2(A a) {
  switch (a) {
    case CET2 _: return 'C';
    case BET2 _: return 'B';
  }
}

main() {
  Expect.equals("B", test1_1(B()));
  Expect.equals("C", test1_1(C()));
  Expect.equals("B", test1_2(B()));
  Expect.equals("C", test1_2(C()));

  Expect.equals("B", test2_1(B()));
  Expect.equals("C", test2_1(C()));
  Expect.equals("B", test2_2(B()));
  Expect.equals("C", test2_2(C()));
}
