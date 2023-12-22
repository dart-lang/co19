// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if the matched value
/// type of a switch expression or statement is a sealed class and the set of
/// cases is exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class A<T> {}

class B<T> extends A<T> {}

class C extends A<int> {}

String test1(A<String> a) => switch (a) { B _ => 'B'};

String test2(A a) => switch (a) { B _ => 'B', C _ => 'C'};

String test3(A<String> a) {
  switch (a) {
    case B _: return 'B';
  }
}

String test4(A a) {
  switch (a) {
    case B _: return 'B';
    case C _: return 'C';
  }
}

main() {
  Expect.equals("B", test1(B<String>()));
  Expect.equals("B", test2(B<String>()));
  Expect.equals("B", test3(B<String>()));
  Expect.equals("B", test4(B<String>()));
}
