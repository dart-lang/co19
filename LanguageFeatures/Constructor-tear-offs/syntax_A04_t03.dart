// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This feature introduces syntax to explicitly instantiate a
/// generic function object or tear-off and a type literal for a generic type.
/// The former for consistency with constructor tear-offs, the latter to
/// introduce in-line types without needing a typedef, like we did for in-line
/// function types originally. We introduce both now because they share the same
/// grammar productions.
///
/// Example:
///
/// T id<T>(T value) => value;
/// var idInt = id<int>; // Explicitly instantiated tear-off, saves on function types.
/// // and
/// Type intList = List<int>; // In-line instantiated type literal.
///
/// @description Checks non-trivial computation to obtain function object for
/// explicit generic instantiation
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs
import "../../Utils/expect.dart";

class C<Y> {
  X foo<X>(X x) => x;
  T Function<T>(T) call<Z>(String s) => foo;
}

main() {
  Expect.equals(42, C<Object>()<int>("Lily was here")<int>(42));
}
