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
/// @description Checks that if `C` denotes an on-declaration with an import
/// prefix and `M` contains exactly one extension, then
/// `C<TypeArguments>.name(arguments)`, `C<TypeArguments>(arguments)`,
/// `C<TypeArguments>.new(arguments)` and the corresponding tearoffs refer to
/// the constructor declared by that extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'constructor_A14_lib.dart' as p;

main() {
  var c1 = p.C.named("1");
  c1.expectStaticType<Exactly<p.C<dynamic>>>();
  Expect.equals("ExtC.named(1)", c1.id);
  var c2 = p.C<int>.named("2");
  c2.expectStaticType<Exactly<p.C<int>>>();
  Expect.equals("ExtC.named(2)", c2.id);
  Expect.equals(int, c2.t);
  p.C<String> c3 = p.C("3");
  Expect.equals("ExtC(3)", c3.id);
  Expect.equals(String, c3.t);
  var c4 = p.C<int>("4");
  c4.expectStaticType<Exactly<p.C<int>>>();
  Expect.equals("ExtC(4)", c4.id);
  var c5 = p.C<int>.new("5");
  c5.expectStaticType<Exactly<p.C<int>>>();
  Expect.equals("ExtC(5)", c5.id);
  var c6 = p.C<int>.named;
  c6.expectStaticType<Exactly<p.C<int> Function(String)>>();
  Expect.equals("ExtC.named(6)", c6("6").id);
  p.C<String> Function(String) c7 = p.C.new;
  Expect.equals("ExtC(7)", c7("7").id);
  Expect.equals(String, c7("7").t);
  Expect.equals(p.ExtC<int>.named, c6);

  var m1 = p.M.named("1");
  m1.expectStaticType<Exactly<p.M<dynamic>>>();
  Expect.equals("ExtM.named(1)", m1.id);
  var m2 = p.M<int>.named("2");
  m2.expectStaticType<Exactly<p.M<int>>>();
  Expect.equals("ExtM.named(2)", m2.id);
  Expect.equals(int, m2.t);
  p.M<String> m3 = p.M("3");
  Expect.equals("ExtM(3)", m3.id);
  Expect.equals(String, m3.t);
  var m4 = p.M<int>("4");
  m4.expectStaticType<Exactly<p.M<int>>>();
  Expect.equals("ExtM(4)", m4.id);
  var m5 = p.M<int>.new("5");
  m5.expectStaticType<Exactly<p.M<int>>>();
  Expect.equals("ExtM(5)", m5.id);
  var m6 = p.M<int>.named;
  m6.expectStaticType<Exactly<p.M<int> Function(String)>>();
  Expect.equals("ExtM.named(6)", m6("6").id);
  p.M<String> Function(String) m7 = p.M.new;
  Expect.equals("ExtM(7)", m7("7").id);
  Expect.equals(String, m7("7").t);
  Expect.equals(p.ExtM<int>.named, m6);

  var mc1 = p.MC.named("1");
  mc1.expectStaticType<Exactly<p.MC<dynamic>>>();
  Expect.equals("ExtMC.named(1)", mc1.id);
  var mc2 = p.MC<int>.named("2");
  mc2.expectStaticType<Exactly<p.MC<int>>>();
  Expect.equals("ExtMC.named(2)", mc2.id);
  Expect.equals(int, mc2.t);
  p.MC<String> mc3 = p.MC("3");
  Expect.equals("ExtMC(3)", mc3.id);
  Expect.equals(String, mc3.t);
  var mc4 = p.MC<int>("4");
  mc4.expectStaticType<Exactly<p.MC<int>>>();
  Expect.equals("ExtMC(4)", mc4.id);
  var mc5 = p.MC<int>.new("5");
  mc5.expectStaticType<Exactly<p.MC<int>>>();
  Expect.equals("ExtMC(5)", mc5.id);
  var mc6 = p.MC<int>.named;
  mc6.expectStaticType<Exactly<p.MC<int> Function(String)>>();
  Expect.equals("ExtMC.named(6)", mc6("6").id);
  p.MC<String> Function(String) mc7 = p.MC.new;
  Expect.equals("ExtMC(7)", mc7("7").id);
  Expect.equals(String, mc7("7").t);
  Expect.equals(p.ExtMC<int>.named, mc6);

  var e1 = p.E.named();
  e1.expectStaticType<Exactly<p.E<dynamic>>>();
  Expect.equals(p.E.e0, e1);
  var e2 = p.E<int>.named();
  e2.expectStaticType<Exactly<p.E<int>>>();
  Expect.equals(p.E.e0, e2);
  var e3 = p.E<String>();
  e3.expectStaticType<Exactly<p.E<String>>>();
  Expect.equals(p.E.e1, e3);
  var e4 = p.E<String>.new();
  e4.expectStaticType<Exactly<p.E<String>>>();
  Expect.equals(p.E.e1, e4);
  var e5 = p.E<int>.named;
  e5.expectStaticType<Exactly<p.E<int> Function()>>();
  Expect.equals(p.E.e0, e5());
  p.E<String> Function() e6 = p.E.new;
  Expect.equals(p.E.e1, e6());
  Expect.equals(p.ExtE<int>.named, e5);

  var et1 = p.ET.named("1");
  et1.expectStaticType<Exactly<p.ET<dynamic>>>();
  Expect.equals("ExtET.named(1)", et1.id);
  var et2 = p.ET<int>.named("2");
  et2.expectStaticType<Exactly<p.ET<int>>>();
  Expect.equals("ExtET.named(2)", et2.id);
  Expect.equals(int, et2.t);
  p.ET<String> et3 = p.ET("3");
  Expect.equals("ExtET(3)", et3.id);
  Expect.equals(String, et3.t);
  var et4 = p.ET<int>("4");
  et4.expectStaticType<Exactly<p.ET<int>>>();
  Expect.equals("ExtET(4)", et4.id);
  var et5 = p.ET<int>.new("5");
  et5.expectStaticType<Exactly<p.ET<int>>>();
  Expect.equals("ExtET(5)", et5.id);
  var et6 = p.ET<int>.named;
  et6.expectStaticType<Exactly<p.ET<int> Function(String)>>();
  Expect.equals("ExtET.named(6)", et6("6").id);
  p.ET<String> Function(String) et7 = p.ET.new;
  Expect.equals("ExtET(7)", et7("7").id);
  Expect.equals(String, et7("7").t);
  Expect.equals(p.ExtET<int>.named, et6);
}
