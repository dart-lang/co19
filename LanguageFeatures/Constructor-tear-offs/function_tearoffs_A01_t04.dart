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
/// @description Checks example from the Spec.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

T id<T>(T value) => value;
var idInt = id<int>;

main() {
  dynamic v = 42;
  var i = idInt(v);
  Expect.isTrue(i is int);
  Expect.isFalse(i is String); // to check that i is not dynamic
  Expect.runtimeIsType<int>(i);
  Expect.runtimeIsNotType<String>(i);
}
