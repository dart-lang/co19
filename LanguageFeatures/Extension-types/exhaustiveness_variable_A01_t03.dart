// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive if the set of cases is exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression is an extension type with a sealed class as a
/// representation type and the set of cases is an exhaustive set of variable
/// patterns with extension types and classes
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

sealed class A {}

class B extends A {}

class C extends A {}

extension type AET1(A _) {}
extension type AET2(A _) implements A {}
extension type BET1(B _) {}
extension type BET2(B _) implements B {}
extension type CET1(C _) {}
extension type CET2(C _) implements C {}

String test1_1(AET1 a) => switch (a) { BET1 _ => 'B', CET1 _ => 'C' };
String test1_2(AET2 a) => switch (a) { BET2 _ => 'B', CET2 _ => 'C' };

String test2_1(AET1 a) => switch (a) { BET1 _ => 'B', CET1 _ => 'C' };
String test2_2(AET2 a) => switch (a) { CET2 _ => 'C', BET2 _ => 'B' };

String test3_1(AET1 a) => switch (a) { BET1 _ => 'B', C _ => 'C' };
String test3_2(AET2 a) => switch (a) { CET2 _ => 'C', B _ => 'B' };

main() {
  Expect.equals("B", test1_1(AET1(B())));
  Expect.equals("C", test1_1(AET1(C())));
  Expect.equals("B", test1_2(AET2(B())));
  Expect.equals("C", test1_2(AET2(C())));

  Expect.equals("B", test2_1(AET1(B())));
  Expect.equals("C", test2_1(AET1(C())));
  Expect.equals("B", test2_2(AET2(B())));
  Expect.equals("C", test2_2(AET2(C())));

  Expect.equals("B", test3_1(AET1(B())));
  Expect.equals("C", test3_1(AET1(C())));
  Expect.equals("B", test3_2(AET2(B())));
  Expect.equals("C", test3_2(AET2(C())));
}
