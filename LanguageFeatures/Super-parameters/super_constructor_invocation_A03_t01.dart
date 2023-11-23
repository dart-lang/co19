// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When inferring the super-constructor invocation, s, targeting the
/// super constructor D, we include the implicit super-parameters from the
/// constructor parameter list:
///
/// The super-constructor invocation s infers a super-constructor invocation s’
/// such that
/// ...
/// For each super parameter p in C, in source order, where p has parameter name
/// n, (inferred or declared) type T, associated super-constructor parameter q,
/// and where S is the type of the parameter q:
///
/// Let xn be an identifier for then name n. As an expression, xn denotes the
/// final variable introduced into the initializer list scope by p.
/// Then s’ has an argument following the previously mentioned arguments:
/// xn if p is positional, or
/// xn: xn if q is named.
///
/// @description Check that super-constructor invocation has correct parameters
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S<T> {
  num n;
  T t;
  S(this.n, this.t);
  S.named(this.t, this.n);
}

class C<T> extends S<T> {
  C.constr1(super.n, String s, super.t);
  C.constr2(int i, super.n, String s, super.t) : super();
  C.constr3(int i, super.t, String s, super.n) : super.named();
}

main() {
  var c11 = C.constr1(1, "Lily was here", 42);
  Expect.equals(1, c11.n);
  Expect.equals(42, c11.t);

  var c12 = C.constr1(1, "Lily was here", "42");
  Expect.equals(1, c12.n);
  Expect.equals("42", c12.t);

  var c21 = C.constr2(1, 2, "Lily was here", 42);
  Expect.equals(2, c21.n);
  Expect.equals(42, c21.t);

  var c22 = C.constr2(1, 2, "Lily was here", "42");
  Expect.equals(2, c22.n);
  Expect.equals("42", c22.t);

  var c31 = C.constr3(1, 3.14, "Lily was here", 42);
  Expect.equals(42, c31.n);
  Expect.equals(3.14, c31.t);

  var c32 = C.constr3(1, "", "Lily was here", 3.14);
  Expect.equals(3.14, c32.n);
  Expect.equals("", c32.t);
}
