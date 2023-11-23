// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that C<X1 extends B1 . . . , Xm extends Bm> is the name
/// and formal type parameters of the enclosing class, const? is const or empty,
/// N is C or C.id0 for some identifier id0, and id is an identifier, then
/// consider a declaration of a redirecting factory constructor k of one of the
/// forms
/// const? factory
///     N(T1 x1 . . . , Tn xn, [Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk]) = R;
/// const? factory
///     N(T1 x1 . . . , Tn xn, {Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk}) = R;
/// where R is of one of the forms T<S1 . . . , Sp> or T<S1 . . . , Sp>.id.
/// ...
/// It is a compile-time error if a formal parameter of k′ has a default value
/// whose type is not a subtype of the type annotation on the corresponding
/// formal parameter in k
///
/// @description Checks that it is a compile-time error is if a factory
/// constructor redirects to a constructor whose type is not a subtype of the
/// factory's function type. Checks the case when constructor function type is
/// not assignable.
/// @author sgrekhov22@gmal.com

class F<T extends num> {
  factory F(int x, [T y]) = C<T>;
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.foo(int x, [T y]) = C.foo;
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.bar(int x, {T y}) = C.bar;
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C<T extends num> implements F<int> {
  C(int x, [int y = 0]) {}
  C.foo(int x, [int y = 0]) {}
  C.bar(int x, {int y = 0}) {}
}

main() {
  print(F);
  print(C);
}
