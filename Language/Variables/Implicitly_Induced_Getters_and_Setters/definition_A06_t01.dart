// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Late-final variable with declared type ⟩. A
/// variable declaration of the form static? late final T id; implicitly induces
/// a setter with the header void set id(T x). If this setter is executed in a
/// situation where the variable id has not been bound, it will bind id to the
/// object that x is bound to. If this setter is executed in a situation where
/// the variable id has been bound to an object, a dynamic error occurs
///
/// @description Checks the static type of an implicit getter of a late final
/// variable with declared type
/// @author sgrekhov22@gmail.com

import "../../../Utils/static_type_helper.dart";

late final int x1;

class C {
  static late final int v1;
  late final int v2;
}

main() {
  x1 = 1;
  x1.expectStaticType<Exactly<int>>();

  C c = C();
  C.v1 = 1;
  C.v1.expectStaticType<Exactly<int>>();
  c.v2 = 2;
  c.v2.expectStaticType<Exactly<int>>();
}
