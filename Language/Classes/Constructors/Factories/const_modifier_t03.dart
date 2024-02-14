// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// It is a compile-time error if k is prefixed with the const modifier but k'
/// is not a constant constructor.
///
/// @description Checks that it is a compile-error if a const redirecting
/// factory constructor redirects to a non-const constructor. Test extension
/// types
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class F {
  const factory F(F _) = FET1;
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const factory F.f2(F _) = FET2.nonConst;
//                          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type FET1(F _) implements F {}

extension type const FET2(F v) implements F {
  FET2.nonConst(this.v) {}
}

enum E {
  e1, e2;

  const E();
  const factory E.f1(E _) = EET1;
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const factory E.f2(E _) = EET2.nonConst;
//                          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type EET1(E _) implements E {}

extension type const EET2(E v) implements E {
  EET2.nonConst(this.v) {}
}

main() {
  print(F);
  print(E);
}
