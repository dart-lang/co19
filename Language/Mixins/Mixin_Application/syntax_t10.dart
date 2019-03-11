/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be a class, M be a mixin with required superinterfaces
 * T1, . . . , Tn, combined superinterface MS, implemented interfaces
 * I1, . . . , Ik and members as mixin member declarations, and let N be a name.
 * ...
 * The mixin application of M to S with name N introduces a new class, C,
 * with name N, superclass S, implemented interface I1, . . . , Ik and members
 * as instance members.
 * @description Test that instance of class (S with M1, M2) is S
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S {
}

class M1 {
}

class M2 {
}

class C extends S with M1, M2 {
}

main() {
  C c = new C();
  Expect.isTrue(c is S);
}
