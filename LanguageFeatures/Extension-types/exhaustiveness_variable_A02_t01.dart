// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive if the set of cases is exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression is an extension type with a sealed class as a
/// representation type and the set of cases is an exhaustive set of variable
/// patterns. Test generic types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

sealed class A<T> {}

class B<T> extends A<T> {}

class C extends A<int> {}

extension type AET1<T>(A<T> _) {}
extension type AET2<T>(A<T> _) implements A<T> {}

String test1_1(AET1<String> a) => switch (a) { B _ => 'B'};
String test1_2(AET2<String> a) => switch (a) { B _ => 'B'};

String test2_1(AET1<int> a) => switch (a) { B _ => 'B', C _ => 'C'};
String test2_2(AET2<int> a) => switch (a) { B _ => 'B', C _ => 'C'};

main() {
  Expect.equals("B", test1_1(AET1(B<String>())));
  Expect.equals("B", test1_2(AET2(B<String>())));
  Expect.equals("B", test2_1(AET1(B<int>())));
  Expect.equals("B", test2_2(AET2(B<int>())));
  Expect.equals("C", test2_1(AET1(C())));
  Expect.equals("C", test2_2(AET2(C())));
}
