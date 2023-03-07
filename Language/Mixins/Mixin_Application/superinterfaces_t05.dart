// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a name.
/// It is a compile-time error to apply M to S if S does not implement, directly
/// or indirectly, all of T1, . . . , Tn.
/// @description Checks that it is no error if M directly implements all
/// its superinterfaces
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

class A {
  int get a => 0;
}

abstract class B implements A {
  int get b;
}

class M implements B {
  int get a => -1;
  int get b => 1;
}

class S {
}

class C extends S with M {
}

main() {
  new C();
}
