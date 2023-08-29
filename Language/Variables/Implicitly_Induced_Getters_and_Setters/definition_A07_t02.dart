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
/// @description Checks that it is a dynamic error if this setter is executed in
/// a situation where the variable has been bound to an object
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

late final x1;

class C {
  static late final v1;
  late final v2;
}

main() {
  Expect.throws(() {
    x1;
  });
  Expect.throws(() {
    C.v1;
  });
  Expect.throws(() {
    C().v2;
  });
}
