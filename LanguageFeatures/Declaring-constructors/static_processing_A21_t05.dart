// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
/// ...
/// Otherwise, a formal parameter (named or positional) of the form` var T p` or
/// `final T p` where `T` is a type and `p` is an identifier is replaced in `L2`
/// by `this.p`, along with its default value, if any. Next, a semantic instance
/// variable declaration corresponding to the syntax `T p;` or `final T p;` is
/// added to `D2`. It includes the modifier `final` if the parameter in `L` has
/// the modifier `final`, or `D` is an extension type declaration and `k` is a
/// declaring header constructor. In all cases, if `p` has the modifier
/// `covariant` then this modifier is removed from the parameter in `L2`, and it
/// is added to the instance variable declaration named `p`.
///
/// @description Check that a formal parameter of the form `var T p` where `T`
/// is a type and `p` is an identifier is replaced in `L2` by `this.p`
/// and a semantic instance variable declaration corresponding to the syntax
/// `T p;` (without `final`) is added to `D2`. Test required parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1<T>(var T v);

class C2(var int v);

class C3<T> {
  this(var T v);
}

class C4 {
  this(var int v);
}

main() {
  var c1 = C1<int>(1);
  Expect.equals(1, c1.v);
  c1.v = 2;
  Expect.equals(2, c1.v);

  var c2 = C2(1);
  Expect.equals(1, c2.v);
  c2.v = 2;
  Expect.equals(2, c2.v);

  var c3 = C3<int>(1);
  Expect.equals(1, c3.v);
  c3.v = 2;
  Expect.equals(2, c3.v);

  var c4 = C4(1);
  Expect.equals(1, c4.v);
  c4.v = 2;
  Expect.equals(2, c4.v);
}
