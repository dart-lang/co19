// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each generative constructor of the form
/// `Sq(T1 a1, ..., Tk ak, [Tk+1 ak+1 = d1, ..., Tk+p ak+p = dp])` of `S` that is
/// accessible to `LC`, `C` has an implicitly declared constructor of the form
/// `Cq(T1 a1, ... , Tk ak, [Tk+1 ak+1 = d′1, ... , Tk+p ak+p = d′p]) :
///     superq(a1, ... , ak, ak+1, ..., ap);`
/// where `Cq` is obtained from `Sq` by replacing occurrences of `SN`, which
/// denote the superclass, by `N`, `superq` is obtained from `Sq` by replacing
/// occurrences of `SN` which denote the superclass by super, and
/// `d′i, i ∈ 1..p`, is a constant expression evaluating to the same value as
/// `di`. If `Sq` is a generative const constructor, and `MC` does not declare
/// any instance variables, `Cq` is also a const constructor.
///
/// @description Checks that if `Sq` is a generative const constructor, and `MC`
/// declares an instance variable then `Cq` is not a const constructor.
/// @author sgrekhov22@gmail.com

class A {
  final bool v1;
  final num v2;
  const A(bool this.v1, [num this.v2 = 3.14]);
}

mixin class M {
  final int x = 1;
}

class MA extends A with M {
  const MA(bool this.v1, [num this.v2 = 3.14]) : super(v1, v2);
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(MA);
