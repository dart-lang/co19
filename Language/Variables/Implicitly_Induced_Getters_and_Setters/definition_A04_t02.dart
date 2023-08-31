// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with no declared type, with
/// initialization⟩.
/// A variable declaration of the form static? late? var id = e; implicitly
/// induces a setter with the header void set id(dynamic x), whose execution
/// sets the value of id to the incoming argument x.
/// Type inference could have provided a type different from dynamic.
///
/// @description Checks that the static type of an implicit setter of a mutable
/// instance variable with no declared type but with an initialization is
/// provided by the type inference
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

class A {
  late var v1 = 1;
  var v2 = 2 as num;
}

class C extends A {
  void set v1(x) {
    x.expectStaticType<Exactly<int>>();
  }

  void set v2(x) {
    x.expectStaticType<Exactly<num>>();
  }
}

main() {
  C c = C();
  c.v1 = -1;
  c.v2 = -2;
  try {
    c.v1 = "1" as dynamic;
  } catch (_) {}
  try {
    c.v2 = "2" as dynamic;
  } catch (_) {}
}
