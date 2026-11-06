// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Otherwise, `M` only includes extensions containing constructors with the
/// requested name. A compile-time error occurs if `M` is empty, or `M` contains
/// two or more elements. Otherwise, the invocation or reference denotes an
/// invocation of or reference to the constructor with uniform base constructor
/// name `name` which is declared by the extension declaration that `M`
/// contains.
///
/// @description Checks that if `M` contains exactly one extension, then
/// `C.name(arguments)`, `C<TypeArguments>.name(arguments)`, `C(arguments)`,
/// `C<TypeArguments>(arguments)`, `C.new(arguments)` and
/// `C<TypeArguments>.new(arguments)` invoke the constructor declared by that
/// extension. Test that extensions whose on-declaration is a subtype or a
/// supertype of `C` (or another declaration) and which declare constructors
/// with the same names are not included in `M`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {
  final String id;
  C._(this.id);
  Type get t => X;
}

class D<X> extends C<X> {
  D._(super.id) : super._();
}

mixin M<X> {
  String get id;
  Type get t => X;
}

class MO<X> with M<X> {
  final String id;
  MO._(this.id);
}

mixin class MC<X> {
  String id = "";
  MC._();
  Type get t => X;
}

class MCO<X> with MC<X> {
  MCO._();
}

enum E1<X> {
  e0<int>._(),
  e1<String>._();

  const E1._();
}

enum E2<X> {
  e0<bool>._();

  const E2._();
}

extension type ET<X>._(String id) {
  Type get t => X;
}

extension type ET2<X>._(String id) implements ET<X> {}

extension ExtC<T> on C<T> {
  factory named(String id) => C<T>._("ExtC.named($id)");
  factory(String id) => C<T>._("ExtC($id)");
}

extension ExtD<T> on D<T> {
  factory named(String id) => D<T>._("ExtD.named($id)");
  factory(String id) => D<T>._("ExtD($id)");
}

extension ExtM<T> on M<T> {
  factory named(String id) => MO<T>._("ExtM.named($id)");
  factory(String id) => MO<T>._("ExtM($id)");
}

extension ExtMO<T> on MO<T> {
  factory named(String id) => MO<T>._("ExtMO.named($id)");
  factory(String id) => MO<T>._("ExtMO($id)");
}

extension ExtMC<T> on MC<T> {
  factory named(String id) => MC<T>._()..id = "ExtMC.named($id)";
  factory(String id) => MC<T>._()..id = "ExtMC($id)";
}

extension ExtMCO<T> on MCO<T> {
  factory named(String id) => MCO<T>._()..id = "ExtMCO.named($id)";
  factory(String id) => MCO<T>._()..id = "ExtMCO($id)";
}

extension ExtE1<T> on E1<T> {
  factory named() => E1.e0 as E1<T>;
  factory() => E1.e1 as E1<T>;
}

extension ExtE2 on Enum {
  factory named() => E2.e0;
  factory() => E2.e0;
}

extension ExtET<T> on ET<T> {
  factory named(String id) => ET<T>._("ExtET.named($id)");
  factory(String id) => ET<T>._("ExtET($id)");
}

extension ExtET2<T> on ET2<T> {
  factory named(String id) => ET2<T>._("ExtET2.named($id)");
  factory(String id) => ET2<T>._("ExtET2($id)");
}

main() {
  var c1 = C.named("1");
  c1.expectStaticType<Exactly<C<dynamic>>>();
  Expect.equals("ExtC.named(1)", c1.id);
  var c2 = C<int>.named("2");
  c2.expectStaticType<Exactly<C<int>>>();
  Expect.equals("ExtC.named(2)", c2.id);
  Expect.equals(int, c2.t);
  C<String> c3 = C("3");
  Expect.equals("ExtC(3)", c3.id);
  Expect.equals(String, c3.t);
  var c4 = C<int>("4");
  c4.expectStaticType<Exactly<C<int>>>();
  Expect.equals("ExtC(4)", c4.id);
  Expect.equals(int, c4.t);
  C<String> c5 = C.new("5");
  Expect.equals("ExtC(5)", c5.id);
  Expect.equals(String, c5.t);
  var c6 = C<int>.new("6");
  c6.expectStaticType<Exactly<C<int>>>();
  Expect.equals("ExtC(6)", c6.id);
  Expect.equals(int, c6.t);
  var c7 = D<int>.named("7");
  c7.expectStaticType<Exactly<D<int>>>();
  Expect.equals("ExtD.named(7)", c7.id);

  var m1 = M.named("1");
  m1.expectStaticType<Exactly<M<dynamic>>>();
  Expect.equals("ExtM.named(1)", m1.id);
  var m2 = M<int>.named("2");
  m2.expectStaticType<Exactly<M<int>>>();
  Expect.equals("ExtM.named(2)", m2.id);
  Expect.equals(int, m2.t);
  M<String> m3 = M("3");
  Expect.equals("ExtM(3)", m3.id);
  Expect.equals(String, m3.t);
  var m4 = M<int>("4");
  m4.expectStaticType<Exactly<M<int>>>();
  Expect.equals("ExtM(4)", m4.id);
  Expect.equals(int, m4.t);
  M<String> m5 = M.new("5");
  Expect.equals("ExtM(5)", m5.id);
  Expect.equals(String, m5.t);
  var m6 = M<int>.new("6");
  m6.expectStaticType<Exactly<M<int>>>();
  Expect.equals("ExtM(6)", m6.id);
  Expect.equals(int, m6.t);
  var m7 = MO<int>.named("7");
  m7.expectStaticType<Exactly<MO<int>>>();
  Expect.equals("ExtMO.named(7)", m7.id);

  var mc1 = MC.named("1");
  mc1.expectStaticType<Exactly<MC<dynamic>>>();
  Expect.equals("ExtMC.named(1)", mc1.id);
  var mc2 = MC<int>.named("2");
  mc2.expectStaticType<Exactly<MC<int>>>();
  Expect.equals("ExtMC.named(2)", mc2.id);
  Expect.equals(int, mc2.t);
  MC<String> mc3 = MC("3");
  Expect.equals("ExtMC(3)", mc3.id);
  Expect.equals(String, mc3.t);
  var mc4 = MC<int>("4");
  mc4.expectStaticType<Exactly<MC<int>>>();
  Expect.equals("ExtMC(4)", mc4.id);
  Expect.equals(int, mc4.t);
  MC<String> mc5 = MC.new("5");
  Expect.equals("ExtMC(5)", mc5.id);
  Expect.equals(String, mc5.t);
  var mc6 = MC<int>.new("6");
  mc6.expectStaticType<Exactly<MC<int>>>();
  Expect.equals("ExtMC(6)", mc6.id);
  Expect.equals(int, mc6.t);
  var mc7 = MCO<int>.named("7");
  mc7.expectStaticType<Exactly<MCO<int>>>();
  Expect.equals("ExtMCO.named(7)", mc7.id);

  var e1 = E1.named();
  e1.expectStaticType<Exactly<E1<dynamic>>>();
  Expect.equals(E1.e0, e1);
  var e2 = E1<int>.named();
  e2.expectStaticType<Exactly<E1<int>>>();
  Expect.equals(E1.e0, e2);
  E1<String> e3 = E1();
  // The static type of e3 is its declared type, so expectStaticType is useless
  // here. T = String is ensured by the assignment and by `as E1<T>`.
  Expect.equals(E1.e1, e3);
  var e4 = E1<String>();
  e4.expectStaticType<Exactly<E1<String>>>();
  Expect.equals(E1.e1, e4);
  E1<String> e5 = E1.new();
  // Same as e3
  Expect.equals(E1.e1, e5);
  var e6 = E1<String>.new();
  e6.expectStaticType<Exactly<E1<String>>>();
  Expect.equals(E1.e1, e6);

  var et1 = ET.named("1");
  et1.expectStaticType<Exactly<ET<dynamic>>>();
  Expect.equals("ExtET.named(1)", et1.id);
  var et2 = ET<int>.named("2");
  et2.expectStaticType<Exactly<ET<int>>>();
  Expect.equals("ExtET.named(2)", et2.id);
  Expect.equals(int, et2.t);
  ET<String> et3 = ET("3");
  Expect.equals("ExtET(3)", et3.id);
  Expect.equals(String, et3.t);
  var et4 = ET<int>("4");
  et4.expectStaticType<Exactly<ET<int>>>();
  Expect.equals("ExtET(4)", et4.id);
  Expect.equals(int, et4.t);
  ET<String> et5 = ET.new("5");
  Expect.equals("ExtET(5)", et5.id);
  Expect.equals(String, et5.t);
  var et6 = ET<int>.new("6");
  et6.expectStaticType<Exactly<ET<int>>>();
  Expect.equals("ExtET(6)", et6.id);
  Expect.equals(int, et6.t);
  var et7 = ET2<int>.named("7");
  et7.expectStaticType<Exactly<ET2<int>>>();
  Expect.equals("ExtET2.named(7)", et7.id);
}
