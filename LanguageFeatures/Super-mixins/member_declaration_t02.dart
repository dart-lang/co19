// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class named `C` declares a member
/// with basename `C`.
///
/// @description Checks that it is a compile-time error if a mixin member has
/// the same name as a mixin declaration. Test a mixin with type parameters.
/// @author sgrekhov@unipro.ru

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I {}
class J {}

class B<T> {}
class C<T> {}

mixin M1<X extends S, Y extends T> on B<X>, C<Y> implements I, J {
  int M1 = 1;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2<X extends S, Y extends T>  on B<X>, C<Y> implements I, J {
  int get M2;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3<X extends S, Y extends T>  on B<X>, C<Y> implements I, J {
  void set M3(p);
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M4<X extends S, Y extends T>  on B<X>, C<Y> implements I, J {
  int M4();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
}
