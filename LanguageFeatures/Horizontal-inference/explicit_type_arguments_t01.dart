// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that if type arguments are specified then horizontal is
/// not happen
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C1 {}
class C2 extends C1 {}
class C3 extends C2 {}
class D1 {}
class D2 extends D1 {}

void f<T, U, V>(void Function(T, U) a, T b, U Function(V) c, V Function(U) d) {
  Expect.equals(C1, T); // Without implicit specification it'd be C3
  Expect.equals(C2, U); // Without implicit specification it'd be C3
  Expect.equals(D1, V); // Without implicit specification it'd be D2
}

main() {
  f<C1, C2, D1>((t, u) {}, C3(), (v) => C3(), (u) => D2());
}
