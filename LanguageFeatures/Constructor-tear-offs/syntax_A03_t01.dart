// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We now allow instantiating function objects, and therefore we do
/// not need to restrict callable objects either.
///
/// The variable initialization above will, after type inference, be
///
/// int Function(int) intId = Id().call<int>;
/// Also, we allow explicitly instantiating a callable object:
///
/// var intId = Id()<int>;
/// is also type-inferred to the same initialization.
///
/// @description Checks callable object invocation with '!'
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs
import "../../Utils/expect.dart";

T foo1<T>(T value) => value;

main() {
  int Function(int)? f1;
  if (2 > 1) {
    f1 = foo1.call<int>;
  }
  Expect.equals(42, f1!(42));

  T foo2<T>(T value) => value;
  int Function(int)? f2;
  if (2 > 1) {
    f2 = foo2.call<int>;
  }
  Expect.equals(42, f2!(42));
}
