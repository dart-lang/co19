// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive if the set of cases is exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression is an extension type with a sealed class as a
/// representation type and the set of cases is an exhaustive set of variable
/// patterns with extension types and classes. Test generic types
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

sealed class A<T> {}

class B<T> extends A<T> {}

class C extends A<int> {}

extension type AET1<T>(A<T> _) {}
extension type AET2<T>(A<T> _) implements A<T> {}
extension type BET1<T>(B<T> _) {}
extension type BET2<T>(B<T> _) implements B<T> {}
extension type CET1(C _) {}
extension type CET2(C _) implements C {}

test1_1(AET1<String> a) => switch (a) { BET1 _ => 'B'};
test1_2(AET2<String> a) => switch (a) { BET2 _ => 'B'};

test2_1(AET1<int> a) => switch (a) { BET1 _ => 'B', C _ => 'C'};
test2_2(AET2<int> a) => switch (a) { B _ => 'B', CET2 _ => 'C'};

test3_1(AET1<int> a) => switch (a) { AET1 _ => 'A'};
test3_2(AET2<int> a) => switch (a) { AET2 _ => 'A'};

main() {
  Expect.equals("B", test1_1(AET1(B<String>())));
  Expect.equals("B", test1_2(AET2(B<String>())));
  Expect.equals("B", test2_1(AET1(B<int>())));
  Expect.equals("B", test2_2(AET2(B<int>())));
  Expect.equals("C", test2_1(AET1(C())));
  Expect.equals("C", test2_2(AET2(C())));
  Expect.equals("A", test3_1(AET1(B())));
  Expect.equals("A", test3_2(AET2(C())));
}
