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
/// @description Checks that the static type of an implicit setter of a late
/// final instance variable with the declared type `T` is `T`
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

class A {
  late final int v1;
}

class C extends A {
  void set v1(x) {
    x.expectStaticType<Exactly<int>>();
  }
}

main() {
  C().v1 = 42;
}
