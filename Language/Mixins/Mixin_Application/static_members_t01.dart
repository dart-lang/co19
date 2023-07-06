// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a
/// name.
/// ...
/// The mixin application of M to S with name N introduces a new class, C, with
/// name N, superclass S, implemented interface I1, . . . , Ik and members as
/// instance members. The class C has no static members.
///
/// @description Checks that the class `C` has no static members
/// @author sgrekhov22@gmail.com

class S {
  static void sstatic() {}
}

mixin class M {
  static void mstatic() {}
}

class C = S with M;

main() {
  C.sstatic();
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C.mstatic();
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
