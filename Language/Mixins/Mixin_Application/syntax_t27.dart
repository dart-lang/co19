// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a name.
/// ...
/// The mixin application of M to S with name N introduces a new class, C,
/// with name N, superclass S, implemented interface I1, . . . , Ik and members
/// as instance members.
///
/// @description Checks that it is not an error if a class mixes in and
/// implements the same mixin class
/// @author sgrekhov22@gmail.com

mixin class M {
  num foo(int i) => i;
}

class C1 with M implements M {}
class C2 = Object with M implements M;

main() {
  C1();
  C2();
}
