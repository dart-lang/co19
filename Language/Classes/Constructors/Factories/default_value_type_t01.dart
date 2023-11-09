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
/// @description Checks that it is a compile-error if a redirectee constructor
/// has a default value whose type is not a subtype of the type annotation on
/// the corresponding formal parameter in the corresponding factory constructor
/// @author sgrekhov22@gmal.com
/// @issue 53997

const num zero = 0 as num;

class F {
  factory F(int x, [int y]) = C;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.foo(int x, [int y]) = C.foo;
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.bar(int x, {int y}) = C.bar;
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C implements F {
  C(int x, [num y = zero]) {}
  C.foo(int x, [num y = zero]) {}
  C.bar(int x, {num y = zero}) {}
}

enum E {
  e1, e2;
  const E();

  factory E.f1([num x = zero]) => E.e1;
  factory E.f2({num x = zero}) => E.e2;

  factory E.fr1([int x]) = E.f1;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory E.fr2({int x}) = E.f2;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F);
  print(E);
}
