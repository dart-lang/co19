// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`C0<T0, ..., Tn>`, `C1<S0, ..., Sk>`) = least upper bound of two
///   interfaces as in Dart 1.
///
/// @description Check that UP(`C0<T0, ..., Tn>`, `C1<S0, ..., Sk>`) = least
/// upper bound of two interfaces. `C0` and `C1` here are not TOP, OBJECT, NULL,
/// BOTTOM, intersection types, types of the form `T?`, type variables, function
/// types, or `Function`, record types, `Future` or `FutureOr` types and not
/// subtypes of each other.
/// @author sgrekhov22@gmail.com
/// @issue 64309

import '../../Utils/static_type_helper.dart';

class A;
mixin class B1 implements A;
mixin class B2 implements A;
class C1 implements B1, B2;
class C2 implements B1, B2;
class M1 = Object with B1, B2;
class M2 = Object with B1, B2;
extension type ET1(C1 _) implements B1, B2 {}
extension type ET2(C2 _) implements B1, B2 {}
enum E1 implements B1, B2 {
  e0;
}
enum E2 implements B1, B2 {
  e0;
}

void f1(C1 c1, C2 c2) {
  var v = 1 > 2 ? c1 : c2;
  v.expectStaticType<Exactly<A>>;
}

void f2(M1 c1, M2 c2) {
  var v = 1 > 2 ? c1 : c2;
  v.expectStaticType<Exactly<A>>;
}

void f3(ET1 et1, ET2 et2) {
  var v = (1 > 2) ? et1 : et2;
  v.expectStaticType<Exactly<A>>();
}

void f4(E1 e1, E2 e2) {
  var v = (1 > 2) ? e1 : e2;
  v.expectStaticType<Exactly<A>>();
}

void main() {
  f1(C1(), C2());
  f2(M1(), M2());
  f3(ET1(C1()), ET2(C2()));
  f4(E1.e0, E2.e0);
}
