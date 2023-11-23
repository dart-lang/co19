// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin declaration defines an interface. The interface for this
/// mixin declaration is equivalent to the interface of the class declared as:
///  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
///    implements D, E { body' }
/// where body' contains abstract declarations corresponding to the instance
/// members of body of the mixin A.
/// . . .
/// and member declarations are not allowed to have the same name as the mixin
/// declaration.
///
/// @description Checks that it is a compile error if a mixin member has the same
/// name as a mixin declaration.
/// @author ngl@unipro.ru


class I {}
class J {}

class B {}
class C {}

mixin M1 on B, C implements I, J {
  int M1 = 1;
//    ^^
// [analyzer] SYNTACTIC_ERROR.MEMBER_WITH_CLASS_NAME
// [cfe] A class member can't have the same name as the enclosing class.
}

mixin M2 on B, C implements I, J {
  int get M2;
//        ^^
// [analyzer] SYNTACTIC_ERROR.MEMBER_WITH_CLASS_NAME
// [cfe] A class member can't have the same name as the enclosing class.
}

mixin M3 on B, C implements I, J {
  void set M3(p);
//         ^^
// [analyzer] SYNTACTIC_ERROR.MEMBER_WITH_CLASS_NAME
// [cfe] A class member can't have the same name as the enclosing class.
}

mixin M4 on B, C implements I, J {
  int M4();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
