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
/// final variable with no declared type and no initialization is `dynamic`
/// @author sgrekhov22@gmail.com

late final x1;

class C {
  static late final v1;
  late final v2;
}

main() {
  x1 = 1;
  try {
    x1.whatever;
  } catch (_) {}

  C.v1 = "1";
  try {
    C.v1.whatever;
  } catch (_) {}
  C c = C();
  c.v2 = true;
  try {
    c.v2.whatever;
  } catch (_) {}
}
