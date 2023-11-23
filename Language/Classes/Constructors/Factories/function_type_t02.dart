// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// The redirectee constructor for this declaration is the constructor k′
/// denoted by R.
/// ...
/// It is a compile error if the function type of k' is not a subtype of the
/// type of k.
///
/// @description Checks that it is a compile-time error is if a factory
/// constructor redirects to a constructor whose type is not a subtype of the
/// factory's function type. Checks the case when constructor return types
/// are not assignable.
/// @author ilya
/// @issue 53934

class F {
  factory F(x) = C;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C { // does not implement F, not assignable to F
  C(x);
}

enum E1 {
  e1, e2;
  const E1();

  factory E1.f() = C;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e1, e2;
  const E2();

  factory E2.f1() = E3;
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  factory E2.f2() = E3.f;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e1, e2;
  const E3();
  factory E3.f() => E3.e1;
}

main() {
  print(F);
  print(E1);
  print(E2);
}
