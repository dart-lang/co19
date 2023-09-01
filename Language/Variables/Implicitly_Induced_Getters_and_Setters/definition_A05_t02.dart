// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with no declared type, no
/// initialization⟩. A variable declaration of the form static? late? var id;
/// implicitly induces a setter with the header void set id(dynamic x), whose
/// execution sets the value of id to the incoming argument x.
///
/// @description Checks that the static type of an implicit setter of a mutable
/// instance variable with no declared type and no initialization is `dynamic`
/// @author sgrekhov22@gmail.com

class A {
  late var v1;
  var v2;
}

class C extends A {
  void set v1(x) {
    try {
      x.whatever;
    } catch(_) {}
  }
  void set v2(x) {
    try {
      x.whatever;
    } catch(_) {}
  }
}

main() {
  C c = C();
  c.v1 = 1;
  c.v1 = "1";
  c.v2 = 2;
  c.v2 = "2";
}
