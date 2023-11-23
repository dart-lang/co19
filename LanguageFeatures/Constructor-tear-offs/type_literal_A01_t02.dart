// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We will introduce syntax allowing you to explicitly instantiate a
/// function tear-off and a type literal for a generic class. The former for
/// consistency with constructor tear-offs, the latter to introduce in-line
/// types without needing a typedef, like we did for function types. And we do
/// both now because they share the same grammar productions.
///
/// Example:
///
///   T id<T>(T value) => value;
///   var idInt = id<int>; // Explicitly instantiated tear-off, saves on writing function types.
/// and
///   Type intList = List<int>; // In-line instantiated type literal.
///
/// @description Checks custom generic class.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A<T> {}

main() {
  Type intA = A<int>;
  A<int> a1 = A<int>();
  Expect.isTrue(a1.runtimeType == intA);
  A<double> a2 = A<double>();
  Expect.isFalse(a2.runtimeType == intA);
  A<num> a3 = A();
  Expect.isFalse(a3.runtimeType == intA);
}
