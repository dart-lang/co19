// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with declared type ⟩. A variable
/// declaration of one of the forms
/// • static? late? T id;
/// • static? late? T id = e;
/// implicitly induces a setter with the header void set id(T x), whose
/// execution sets the value of id to the incoming argument x.
///
/// @description Checks the static type of an implicit setter of a mutable
/// instance variable with declared type
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

class A {
  late int v1;
  int? v2;
  late int v3 = 3;
  num v4 = 4;
}

class C extends A {
  void set v1(x) {
    x.expectStaticType<Exactly<int>>();
  }
  void set v2(x) {
    x.expectStaticType<Exactly<int?>>();
  }
  void set v3(x) {
    x.expectStaticType<Exactly<int>>();
  }
  void set v4(x) {
    x.expectStaticType<Exactly<num>>();
  }
}

main() {
  C c = C();
  c.v1 = -1;
  c.v2 = -2;
  c.v3 = -3;
  c.v4 = -4;
}
