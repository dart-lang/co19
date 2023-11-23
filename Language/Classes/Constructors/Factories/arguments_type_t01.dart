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
/// Let Ts be the static argument list type (T1 . . . , Tn+k) when k takes no
/// named arguments, and (T1 . . . , Tn, Tn+1 xn+1, . . . , Tn+k xn+k) when k
/// takes some named arguments. It is a compile-time error if Ts is not a
/// subtype match for the formal parameter list of the redirectee.
///
/// @description Checks that a compile error is produced if factory constructor
/// type parameters are not subtypes of bounds of corresponding type parameters
/// of redirected class constructor.
/// @author ilya

class F<T extends String> {
  factory F([T x]) = C;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C<T extends num> implements F<T> {
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

  C([T x]);
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F<String>);
}
