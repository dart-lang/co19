// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Late-final variable with no declared type, no
/// initialization⟩. A variable declaration of the form static? late final id;
/// implicitly induces a setter with the header void set id(dynamic x). An
/// execution of said setter in a situation where the variable id has not been
/// bound will bind id to the object that the argument x is bound to. An
/// execution of the setter in a situation where the variable id has been bound
/// to an object will incur a dynamic error
///
/// @description Checks that the static type of an implicit setter of a late
/// final instance variable with no declared type and no initialization is
/// `dynamic`
/// @author sgrekhov22@gmail.com

class A {
  late final v1;
}

class C extends A {
  void set v1(x) {
    try {
      x.whatever;
    } catch(_) {}
  }
}

main() {
  C().v1 = "";
}
