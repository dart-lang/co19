// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance creation expression of any of the following forms is
/// considered to be a reference to `name`:
/// - `C<TypeArguments>.name(arguments)` where `<TypeArguments>` may be absent
///   and where `name` may be `new`.
/// - `C<TypeArguments>(arguments)` where `<TypeArguments>` may be absent and
///   where `name` is considered to be `new`.
///
/// Similarly a constructor tearoff of any of the following forms is considered
/// to be a reference to `name`:
/// - `C<TypeArguments>.name` where `<TypeArguments>` may be absent and where
///   `name` may be `new`.
/// - `C<TypeArguments>` where `<TypeArguments>` may be absent and where `name`
///   is considered to be `new`.
///
/// In any of these cases, assume that `C` denotes a type introducing membered
/// declaration `D` (where `C` may include an import prefix). Assume that `D`
/// does not declare a constructor with uniform base constructor name `name`.
///
/// @description Checks that if `D` declares a constructor with uniform base
/// constructor name `name`, then `C<TypeArguments>.name(arguments)`,
/// `C<TypeArguments>(arguments)`, `C<TypeArguments>.new(arguments)` and the
/// corresponding tearoffs (where `<TypeArguments>` may be absent) refer to that
/// constructor, even if one or more accessible extensions declare constructors
/// with the same name. Test an implicitly induced default constructor as well.
/// Test that the constructors declared in the extensions are still accessible
/// via the extension name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {
  final String id;
  C(this.id);
  C.named(String id) : id = "C.named($id)";
  C._(this.id);
}

class D<X> {
  String id = "D";
}

mixin class MC<X> {
  String id = "";
  MC._();
  factory MC(String id) => MC<X>._()..id = "MC($id)";
  factory MC.named(String id) => MC<X>._()..id = "MC.named($id)";
}

extension type ET<X>(String id) {
  ET.named(String id) : this("ET.named($id)");
}

// Enums are tested in constructor_A16_t02.dart, because it is an error to
// invoke or tear off generative constructors of an enum.

extension ExtD1<T> on D<T> {
  factory() => D<T>()..id = "ExtD1";
}

extension ExtD2<T> on D<T> {
  factory() => D<T>()..id = "ExtD2";
}

extension ExtC1<T> on C<T> {
  factory named(String id) => C<T>._("ExtC1.named($id)");
  factory(String id) => C<T>._("ExtC1($id)");
}

extension ExtC2<T> on C<T> {
  factory named(String id) => C<T>._("ExtC2.named($id)");
  factory(String id) => C<T>._("ExtC2($id)");
}

extension ExtMC1<T> on MC<T> {
  factory named(String id) => MC<T>._()..id = "ExtMC1.named($id)";
  factory(String id) => MC<T>._()..id = "ExtMC1($id)";
}

extension ExtMC2<T> on MC<T> {
  factory named(String id) => MC<T>._()..id = "ExtMC2.named($id)";
  factory(String id) => MC<T>._()..id = "ExtMC2($id)";
}

extension ExtET1<T> on ET<T> {
  factory named(String id) => ET<T>("ExtET1.named($id)");
  factory(String id) => ET<T>("ExtET1($id)");
}

extension ExtET2<T> on ET<T> {
  factory named(String id) => ET<T>("ExtET2.named($id)");
  factory(String id) => ET<T>("ExtET2($id)");
}

main() {
  Expect.equals("C.named(1)", C.named("1").id);
  Expect.equals("C.named(2)", C<int>.named("2").id);
  Expect.equals("3", C("3").id);
  Expect.equals("4", C<int>("4").id);
  Expect.equals("5", C.new("5").id);
  Expect.equals("6", C<int>.new("6").id);
  var cf1 = C<int>.named;
  cf1.expectStaticType<Exactly<C<int> Function(String)>>();
  Expect.equals("C.named(7)", cf1("7").id);
  var cf2 = C<int>.new;
  cf2.expectStaticType<Exactly<C<int> Function(String)>>();
  Expect.equals("8", cf2("8").id);
  var cf3 = C.named;
  cf3.expectStaticType<Exactly<C<Y> Function<Y>(String)>>();
  Expect.equals("C.named(9)", cf3<int>("9").id);
  var cf4 = C.new;
  cf4.expectStaticType<Exactly<C<Y> Function<Y>(String)>>();
  Expect.equals("10", cf4<int>("10").id);
  C<int> Function(String) cf5 = C.named;
  Expect.equals("C.named(11)", cf5("11").id);
  C<int> Function(String) cf6 = C.new;
  Expect.equals("12", cf6("12").id);
  Expect.equals("ExtC1.named(9)", ExtC1.named("9").id);
  Expect.equals("ExtC2(10)", ExtC2.new("10").id);

  Expect.equals("MC.named(1)", MC.named("1").id);
  Expect.equals("MC.named(2)", MC<int>.named("2").id);
  Expect.equals("MC(3)", MC("3").id);
  Expect.equals("MC(4)", MC<int>("4").id);
  Expect.equals("MC(5)", MC.new("5").id);
  Expect.equals("MC(6)", MC<int>.new("6").id);
  var mcf1 = MC<int>.named;
  mcf1.expectStaticType<Exactly<MC<int> Function(String)>>();
  Expect.equals("MC.named(7)", mcf1("7").id);
  var mcf2 = MC<int>.new;
  mcf2.expectStaticType<Exactly<MC<int> Function(String)>>();
  Expect.equals("MC(8)", mcf2("8").id);
  var mcf3 = MC.named;
  mcf3.expectStaticType<Exactly<MC<Y> Function<Y>(String)>>();
  Expect.equals("MC.named(9)", mcf3<int>("9").id);
  var mcf4 = MC.new;
  mcf4.expectStaticType<Exactly<MC<Y> Function<Y>(String)>>();
  Expect.equals("MC(10)", mcf4<int>("10").id);
  MC<int> Function(String) mcf5 = MC.named;
  Expect.equals("MC.named(11)", mcf5("11").id);
  MC<int> Function(String) mcf6 = MC.new;
  Expect.equals("MC(12)", mcf6("12").id);
  Expect.equals("ExtMC1.named(9)", ExtMC1.named("9").id);
  Expect.equals("ExtMC2(10)", ExtMC2.new("10").id);

  Expect.equals("ET.named(1)", ET.named("1").id);
  Expect.equals("ET.named(2)", ET<int>.named("2").id);
  Expect.equals("3", ET("3").id);
  Expect.equals("4", ET<int>("4").id);
  Expect.equals("5", ET.new("5").id);
  Expect.equals("6", ET<int>.new("6").id);
  var etf1 = ET<int>.named;
  etf1.expectStaticType<Exactly<ET<int> Function(String)>>();
  Expect.equals("ET.named(7)", etf1("7").id);
  var etf2 = ET<int>.new;
  etf2.expectStaticType<Exactly<ET<int> Function(String)>>();
  Expect.equals("8", etf2("8").id);
  var etf3 = ET.named;
  etf3.expectStaticType<Exactly<ET<Y> Function<Y>(String)>>();
  Expect.equals("ET.named(9)", etf3<int>("9").id);
  var etf4 = ET.new;
  etf4.expectStaticType<Exactly<ET<Y> Function<Y>(String)>>();
  Expect.equals("10", etf4<int>("10").id);
  ET<int> Function(String) etf5 = ET.named;
  Expect.equals("ET.named(11)", etf5("11").id);
  ET<int> Function(String) etf6 = ET.new;
  Expect.equals("12", etf6("12").id);
  Expect.equals("ExtET1.named(9)", ExtET1.named("9").id);
  Expect.equals("ExtET2(10)", ExtET2.new("10").id);

  // Even an implicitly induced constructor wins over an extension constructor.
  Expect.equals("D", D().id);
  Expect.equals("D", D<int>().id);
  Expect.equals("D", D.new().id);
  Expect.equals("D", D<int>.new().id);
  var df1 = D.new;
  df1.expectStaticType<Exactly<D<Y> Function<Y>()>>();
  Expect.equals("D", df1<int>().id);
  var df2 = D<int>.new;
  df2.expectStaticType<Exactly<D<int> Function()>>();
  Expect.equals("D", df2().id);
  D<int> Function() df3 = D.new;
  Expect.equals("D", df3().id);
  Expect.equals("ExtD1", ExtD1.new().id);
  Expect.equals("ExtD2", ExtD2<int>.new().id);
}
