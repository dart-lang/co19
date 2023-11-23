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

import "../../Utils/expect.dart";

T foo<T>(T value) => value;
typedef T Foo<T>(T t);

Foo<T> getFoo1<T>() => foo<T>;
T Function<T>(T) getFoo2() => foo;

main() {
  Expect.equals(42, getFoo1<int>()(42));
  Expect.equals(42, getFoo2()<int>(42));
}
