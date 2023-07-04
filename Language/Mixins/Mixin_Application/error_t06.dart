// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A clause of the form S with M1, ..., Mn with name N defines a
/// class as follows:
/// If there is only one mixin (n = 1), then S with M1 defines the class yielded
/// by the mixin application of the mixin of M1 to the class denoted by S with
/// name N.
/// If there is more than one mixin (n > 1), then let X be the class defined by
/// S with M1, ..., Mn−1 with name F, where F is a fresh name, and make X
/// abstract. Then S with M1, ..., Mn defines the class yielded by the mixin
/// application of the mixin of Mn to the class X with name N.
/// In either case, let K be a class declaration with the same constructors,
/// superclass, interfaces and instance members as the defined class. It is a
/// compile-time error if the declaration of K would cause a compile-time error.
///
/// @description Checks that it is a compile-time error if `M` contains a member
/// declaration `d` which overrides a member signature `m` in the interface of
/// `S`, but which is not a correct override of `m`. Test type aliases
/// @author sgrekhov@unipro.ru
/// @issue 23878

class S {
}

mixin class M1 {
  int get g => 1;
}

mixin class M2 {
  String get g => "";
}

typedef MAlias1 = M1;
typedef MAlias2 = M2;

class C = S with MAlias1, MAlias2;
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
