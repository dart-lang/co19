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
/// For each named argument x: e of s, in source order:
///
/// if e infers m with context type S, where S is the type of the parameter
/// named x of the targeted super-constructor,
/// then x: m is a named argument of s’ following the previously mentioned
/// arguments.
///
/// @description Check that super-constructor invocation has correct parameters
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S<T> {
  num? n;
  T? t;
  String log;
  S({this.n, this.t}) : log = "S";
  S.named({this.t, this.n}) : log = "S.named";
}

class C<T> extends S<T> {
  C.constr1(String s, {super.t});
  C.constr2(int i, String s, {super.n}) : super();
  C.constr3(int i, String s, {super.n, super.t}) : super.named();
}

main() {
  var c11 = C.constr1("Lily was here", t: 42);
  Expect.equals(null, c11.n);
  Expect.equals(42, c11.t);
  Expect.equals("S", c11.log);

  var c12 = C.constr1("Lily was here", t: "42");
  Expect.equals(null, c12.n);
  Expect.equals("42", c12.t);
  Expect.equals("S", c12.log);

  var c21 = C.constr2(1, "Lily was here", n: 3.14);
  Expect.equals(3.14, c21.n);
  Expect.equals(null, c21.t);
  Expect.equals("S", c21.log);

  var c22 = C.constr2(1, "Lily was here", n: 2);
  Expect.equals(2, c22.n);
  Expect.equals(null, c22.t);
  Expect.equals("S", c22.log);

  var c31 = C.constr3(1, "Lily was here", n: 42, t: 3.14);
  Expect.equals(42, c31.n);
  Expect.equals(3.14, c31.t);
  Expect.equals("S.named", c31.log);

  var c32 = C.constr3(1, "Lily was here", n: 3.14, t: 42);
  Expect.equals(3.14, c32.n);
  Expect.equals(42, c32.t);
  Expect.equals("S.named", c32.log);
}
