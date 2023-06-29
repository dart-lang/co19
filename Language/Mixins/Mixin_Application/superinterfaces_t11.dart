// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a
/// name.
/// It is a compile-time error to apply M to S if S does not implement, directly
/// or indirectly, all of T1, . . . , Tn.
///
/// @description Checks that it is no error if `C` does implement directly all
/// of the direct superinterfaces of `M`. Test type aliases
/// @author sgrekhov@unipro.ru

abstract class A {
  int get a;
}

abstract class B implements A {
  int get b;
}

abstract mixin class M implements B {
}

class S {
}

typedef MAlias = M;

class C extends S with MAlias {
  int get a => 0;
  int get b => 0;
}

main() {
  new C();
}
