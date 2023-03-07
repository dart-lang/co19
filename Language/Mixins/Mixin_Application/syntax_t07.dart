// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a name.
/// ...
/// The mixin application of M to S with name N introduces a new class, C,
/// with name N, superclass S, implemented interface I1, . . . , Ik and members
/// as instance members.
/// @description Test that instance of class (S with M) is S
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import "../../../Utils/expect.dart";

class S {
}

class M {
}

class C1 = S with M;

class C2 extends S with M {
}

main() {
  C1 c1 = new C1();
  Expect.isTrue(c1 is S);
  Expect.runtimeIsType<S>(c1);

  C2 c2 = new C2();
  Expect.isTrue(c2 is S);
  Expect.runtimeIsType<S>(c2);
}
