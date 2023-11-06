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
///
/// It is a compile-time error if T does not denote a class accessible in the
/// current scope. If T does denote such a class D, it is a compile-time error
/// if R does not denote a constructor. Otherwise, it is a compile-time error if
/// R denotes a generative constructor and D is abstract.
///
/// @description Checks that a compile error is produced if referenced type in a
/// redirecting constructor is in fact an accessible type, but the referenced
/// name does not denote a constructor.
/// @author ilya

class F {
  factory F.foo() = C.foo;
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory F.bar() = C.bar;
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory F.baz() = C.cInstance;
//                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C implements F {
  C foo() => this;
  late C bar;
  static C cInstance() => C();
  static E eInstance() => E.e1;

  C() {
    bar = this;
  }
}

enum E {
  e1, e2;

  factory E.foo() = C.eInstance;
//                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F);
  print(E);
}
