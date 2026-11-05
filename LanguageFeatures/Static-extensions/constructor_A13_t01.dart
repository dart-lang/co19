// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Otherwise, if `M` only includes static members then this is not an
/// instance creation expression, it is a static member invocation or reference
/// and it is specified in an earlier section.
///
/// @description Checks that if `M` only includes static members, then
/// `C.name(arguments)` and `C.name` are a static member invocation and a static
/// member tearoff, even if the extension is generic. Test that the static type
/// of the invocation is the return type of the static method (and not an
/// instantiation of `C`), that type arguments may be passed to a generic static
/// method, and that a tearoff has the function type of the static method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {}

mixin M<X> {}

mixin class MC<X> {}

enum E<X> {
  e0<Never>();
}

extension type ET<X>(int _) {}

extension ExtC<T> on C<T> {
  static String foo(String s) => "ExtC.foo($s)";
  static List<Y> bar<Y>(Y y) => <Y>[y];
}

extension ExtM<T> on M<T> {
  static String foo(String s) => "ExtM.foo($s)";
  static List<Y> bar<Y>(Y y) => <Y>[y];
}

extension ExtMC<T> on MC<T> {
  static String foo(String s) => "ExtMC.foo($s)";
  static List<Y> bar<Y>(Y y) => <Y>[y];
}

extension ExtE<T> on E<T> {
  static String foo(String s) => "ExtE.foo($s)";
  static List<Y> bar<Y>(Y y) => <Y>[y];
}

extension ExtET<T> on ET<T> {
  static String foo(String s) => "ExtET.foo($s)";
  static List<Y> bar<Y>(Y y) => <Y>[y];
}

main() {
  var c1 = C.foo("1");
  c1.expectStaticType<Exactly<String>>();
  Expect.equals("ExtC.foo(1)", c1);
  var c2 = C.bar<num>(2);
  c2.expectStaticType<Exactly<List<num>>>();
  Expect.listEquals(<num>[2], c2);
  var c3 = C.bar(3);
  c3.expectStaticType<Exactly<List<int>>>();
  Expect.listEquals(<int>[3], c3);
  var fc1 = C.foo;
  fc1.expectStaticType<Exactly<String Function(String)>>();
  Expect.equals("ExtC.foo(4)", fc1("4"));
  var fc2 = C.bar;
  fc2.expectStaticType<Exactly<List<Y> Function<Y>(Y)>>();
  Expect.listEquals(<String>["5"], fc2<String>("5"));
  var fc3 = C.bar<int>;
  fc3.expectStaticType<Exactly<List<int> Function(int)>>();
  Expect.listEquals(<int>[6], fc3(6));

  var m1 = M.foo("1");
  m1.expectStaticType<Exactly<String>>();
  Expect.equals("ExtM.foo(1)", m1);
  var m2 = M.bar<num>(2);
  m2.expectStaticType<Exactly<List<num>>>();
  Expect.listEquals(<num>[2], m2);
  var m3 = M.bar(3);
  m3.expectStaticType<Exactly<List<int>>>();
  Expect.listEquals(<int>[3], m3);
  var fm1 = M.foo;
  fm1.expectStaticType<Exactly<String Function(String)>>();
  Expect.equals("ExtM.foo(4)", fm1("4"));
  var fm2 = M.bar;
  fm2.expectStaticType<Exactly<List<Y> Function<Y>(Y)>>();
  Expect.listEquals(<String>["5"], fm2<String>("5"));
  var fm3 = M.bar<int>;
  fm3.expectStaticType<Exactly<List<int> Function(int)>>();
  Expect.listEquals(<int>[6], fm3(6));

  var mc1 = MC.foo("1");
  mc1.expectStaticType<Exactly<String>>();
  Expect.equals("ExtMC.foo(1)", mc1);
  var mc2 = MC.bar<num>(2);
  mc2.expectStaticType<Exactly<List<num>>>();
  Expect.listEquals(<num>[2], mc2);
  var mc3 = MC.bar(3);
  mc3.expectStaticType<Exactly<List<int>>>();
  Expect.listEquals(<int>[3], mc3);
  var fmc1 = MC.foo;
  fmc1.expectStaticType<Exactly<String Function(String)>>();
  Expect.equals("ExtMC.foo(4)", fmc1("4"));
  var fmc2 = MC.bar;
  fmc2.expectStaticType<Exactly<List<Y> Function<Y>(Y)>>();
  Expect.listEquals(<String>["5"], fmc2<String>("5"));
  var fmc3 = MC.bar<int>;
  fmc3.expectStaticType<Exactly<List<int> Function(int)>>();
  Expect.listEquals(<int>[6], fmc3(6));

  var e1 = E.foo("1");
  e1.expectStaticType<Exactly<String>>();
  Expect.equals("ExtE.foo(1)", e1);
  var e2 = E.bar<num>(2);
  e2.expectStaticType<Exactly<List<num>>>();
  Expect.listEquals(<num>[2], e2);
  var e3 = E.bar(3);
  e3.expectStaticType<Exactly<List<int>>>();
  Expect.listEquals(<int>[3], e3);
  var fe1 = E.foo;
  fe1.expectStaticType<Exactly<String Function(String)>>();
  Expect.equals("ExtE.foo(4)", fe1("4"));
  var fe2 = E.bar;
  fe2.expectStaticType<Exactly<List<Y> Function<Y>(Y)>>();
  Expect.listEquals(<String>["5"], fe2<String>("5"));
  var fe3 = E.bar<int>;
  fe3.expectStaticType<Exactly<List<int> Function(int)>>();
  Expect.listEquals(<int>[6], fe3(6));

  var et1 = ET.foo("1");
  et1.expectStaticType<Exactly<String>>();
  Expect.equals("ExtET.foo(1)", et1);
  var et2 = ET.bar<num>(2);
  et2.expectStaticType<Exactly<List<num>>>();
  Expect.listEquals(<num>[2], et2);
  var et3 = ET.bar(3);
  et3.expectStaticType<Exactly<List<int>>>();
  Expect.listEquals(<int>[3], et3);
  var fet1 = ET.foo;
  fet1.expectStaticType<Exactly<String Function(String)>>();
  Expect.equals("ExtET.foo(4)", fet1("4"));
  var fet2 = ET.bar;
  fet2.expectStaticType<Exactly<List<Y> Function<Y>(Y)>>();
  Expect.listEquals(<String>["5"], fet2<String>("5"));
  var fet3 = ET.bar<int>;
  fet3.expectStaticType<Exactly<List<int> Function(int)>>();
  Expect.listEquals(<int>[6], fet3(6));
}
