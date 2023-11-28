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
///
/// It is a compile-time error if T does not denote a class accessible in the
/// current scope. If T does denote such a class D, it is a compile-time error
/// if R does not denote a constructor. Otherwise, it is a compile-time error if
/// R denotes a generative constructor and D is abstract.
///
/// @description Checks that a compile error is produced if `T` does not denote
/// a class accessible in the current scope.
/// @author sgrekhov22@gmail.com

import "accessible_class_A01_t02_lib.dart";

class C {
  factory C() = _PrivateClass;
//              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
