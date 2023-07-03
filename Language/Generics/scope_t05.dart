// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type parameters are declared in the type parameter scope of a
/// class or function. The type parameters of a generic G are in scope in the
/// bounds of all of the type parameters of G. The type parameters of a generic
/// class declaration G are also in scope in the extends and implements clauses
/// of G (if these exist) and in the body of G.
///
/// @description Checks that bounded type parameters with the same names have
/// correct scopes
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

abstract interface class I<T> {
  void mi<T>();
}

abstract class C1 extends I<double> {}
abstract class C2 implements I<double> {}

checkStaticType(C1 c1, C2 c2) {
  c1.mi.expectStaticType<Exactly<void Function<T>()>>();
  c2.mi.expectStaticType<Exactly<void Function<T>()>>();
}

main() {
  print(checkStaticType);
}
