// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The resulting constructor invocations are subject to type
/// inference, using the empty context type. This implies that inferred type
/// arguments to the constructor invocation itself may depend on the types of
/// the argument expressions of args. The type of the constant variable is the
/// static type of the resulting constant object creation expression.
///
/// @description Check that omitted type arguments to a generic enum class are
/// filled in by type inference, using the type of arguments
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

enum E<T> {
  e1(1),
  e2("1"),
  e3(true);

  final T t;
  const E(this.t);
}

main() {
  Expect.equals(1, E.e1.t);
  Expect.equals("1", E.e2.t);
  Expect.equals(true, E.e3.t);

  Expect.equals("$int", E.e1.t.runtimeType.toString());
  Expect.equals("$String", E.e2.t.runtimeType.toString());
  Expect.equals("$bool", E.e3.t.runtimeType.toString());
}
