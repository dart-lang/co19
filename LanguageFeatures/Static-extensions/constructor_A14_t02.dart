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
/// `C.name`, `C<TypeArguments>.name`, `C.new` and `C<TypeArguments>.new` are
/// tearoffs of the constructor declared by that extension. Test that
/// extensions whose on-declaration is a subtype of `C` (or another declaration)
/// and which declare constructors with the same names are not included in `M`.
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

enum E<X> {
  e0<Never>._(),
  e1<Never>._();

  const E._();
}

enum E2<X> {
  e0<Never>._();

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

extension ExtE<T> on E<T> {
  factory named(String _) => E.e0;
  factory(String _) => E.e1;
}

extension ExtE2<T> on E2<T> {
  factory named(String _) => E2.e0;
  factory(String _) => E2.e0;
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
  var fc1 = C.named;
  fc1.expectStaticType<Exactly<C<X> Function<X>(String)>>();
  Expect.equals("ExtC.named(1)", fc1<int>("1").id);
  Expect.equals(int, fc1<int>("1").t);
  var fc2 = C<int>.named;
  fc2.expectStaticType<Exactly<C<int> Function(String)>>();
  Expect.equals("ExtC.named(2)", fc2("2").id);
  var fc3 = C.new;
  fc3.expectStaticType<Exactly<C<X> Function<X>(String)>>();
  Expect.equals("ExtC(3)", fc3<int>("3").id);
  Expect.equals(int, fc3<int>("3").t);
  var fc4 = C<int>.new;
  fc4.expectStaticType<Exactly<C<int> Function(String)>>();
  Expect.equals("ExtC(4)", fc4("4").id);

  var fm1 = M.named;
  fm1.expectStaticType<Exactly<M<X> Function<X>(String)>>();
  Expect.equals("ExtM.named(1)", fm1<int>("1").id);
  Expect.equals(int, fm1<int>("1").t);
  var fm2 = M<int>.named;
  fm2.expectStaticType<Exactly<M<int> Function(String)>>();
  Expect.equals("ExtM.named(2)", fm2("2").id);
  var fm3 = M.new;
  fm3.expectStaticType<Exactly<M<X> Function<X>(String)>>();
  Expect.equals("ExtM(3)", fm3<int>("3").id);
  Expect.equals(int, fm3<int>("3").t);
  var fm4 = M<int>.new;
  fm4.expectStaticType<Exactly<M<int> Function(String)>>();
  Expect.equals("ExtM(4)", fm4("4").id);

  var fmc1 = MC.named;
  fmc1.expectStaticType<Exactly<MC<X> Function<X>(String)>>();
  Expect.equals("ExtMC.named(1)", fmc1<int>("1").id);
  Expect.equals(int, fmc1<int>("1").t);
  var fmc2 = MC<int>.named;
  fmc2.expectStaticType<Exactly<MC<int> Function(String)>>();
  Expect.equals("ExtMC.named(2)", fmc2("2").id);
  var fmc3 = MC.new;
  fmc3.expectStaticType<Exactly<MC<X> Function<X>(String)>>();
  Expect.equals("ExtMC(3)", fmc3<int>("3").id);
  Expect.equals(int, fmc3<int>("3").t);
  var fmc4 = MC<int>.new;
  fmc4.expectStaticType<Exactly<MC<int> Function(String)>>();
  Expect.equals("ExtMC(4)", fmc4("4").id);

  var fe1 = E.named;
  fe1.expectStaticType<Exactly<E<X> Function<X>(String)>>();
  Expect.equals(E.e0, fe1<int>("1"));
  var fe2 = E<int>.named;
  fe2.expectStaticType<Exactly<E<int> Function(String)>>();
  Expect.equals(E.e0, fe2("2"));
  var fe3 = E.new;
  fe3.expectStaticType<Exactly<E<X> Function<X>(String)>>();
  Expect.equals(E.e1, fe3<int>("3"));
  var fe4 = E<int>.new;
  fe4.expectStaticType<Exactly<E<int> Function(String)>>();
  Expect.equals(E.e1, fe4("4"));

  var fet1 = ET.named;
  fet1.expectStaticType<Exactly<ET<X> Function<X>(String)>>();
  Expect.equals("ExtET.named(1)", fet1<int>("1").id);
  Expect.equals(int, fet1<int>("1").t);
  var fet2 = ET<int>.named;
  fet2.expectStaticType<Exactly<ET<int> Function(String)>>();
  Expect.equals("ExtET.named(2)", fet2("2").id);
  var fet3 = ET.new;
  fet3.expectStaticType<Exactly<ET<X> Function<X>(String)>>();
  Expect.equals("ExtET(3)", fet3<int>("3").id);
  Expect.equals(int, fet3<int>("3").t);
  var fet4 = ET<int>.new;
  fet4.expectStaticType<Exactly<ET<int> Function(String)>>();
  Expect.equals("ExtET(4)", fet4("4").id);
}
