// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is no compile-time error if matched type of a
/// switch expression is a sealed class and all cases are exhaustive
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

sealed class A<T> {}

class B<T> extends A<T> {}

class C extends A<int> {}

test1(A<String> a) => switch (a) { B _ => 'B'};

test2(A<String> a) => switch (a) { B _ => 'B', C _ => 'C'};

main() {
  Expect.equals("B", test1(B<String>()));
  Expect.equals("B", test2(B<String>()));
}
