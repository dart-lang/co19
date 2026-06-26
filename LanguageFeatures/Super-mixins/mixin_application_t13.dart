// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `S` be a class, `M` be a mixin with required superinterfaces
/// `T1, ..., Tn`, combined superinterface `MS`, implemented interfaces
/// `I1, ..., Ik` and members as member declarations, and let `N` be a name.
///
/// It is a compile-time error to apply `M` to `S` if `S` does not implement,
/// directly or indirectly, all of `T1, ..., Tn`.
///
/// @description Checks that it is a compile-time error if a mixin is applied to
/// a class that does not implement all the 'on' type requirements of the mixin
/// declaration.
/// @author sgrekhov@unipro.ru

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I<T> {}
class J<T> {}
class B<T> {}
class C<T> {}

mixin M<X extends S, Y extends T> on B<X>, C<Y> implements I<S>, J<T> {}

class A<T1, T2, T3, T4> implements B<T1>, C<T2>, I<T3>, J<T4> {}

class MA extends A<X, Y, S, S> with M<X, Y> {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MA);
}
