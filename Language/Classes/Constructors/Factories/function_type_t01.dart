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
/// factory's function type. Checks the case when constructor parameter types
/// are not assignable.
/// @author ilya

class F {
  factory F(x,[String y]) = C;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  factory F.foo(x,{Object y}) = C.foo;
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C implements F {
  C(x,[int? y]);
  C.foo(x,{int? y});
}

enum E {
  e1, e2;
  const E();

  factory E.f1([int x = 0]) => E.e1;

  factory E.fr1([String x]) = E.f1;
  //                          ^^^^
  // [analyzer] unspecified
  // [cfe] unspecified
}

main() {
  print(F);
  print(E);
}
