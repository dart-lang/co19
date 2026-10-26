// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Checks that it is not an error if an extension declares a
/// constructor whose name is the name of a type alias whose expansion yields
/// the on-declaration of the extension. Test on-types denoted by identifiers
/// with an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'constructor_A04_lib.dart' as p;

extension ExtC on p.C {
  factory CAlias() => p.C.someName();
}

extension on p.CAlias {
  factory CAlias2() = p.C.someName;
}

extension ExtM on p.M {
  factory MAlias() => p.MO();
}

extension on p.MAlias {
  factory MAlias2() = p.MO.new;
}

extension ExtMC on p.MC {
  factory MCAlias() => p.MC.someName();
}

extension on p.MCAlias {
  factory MCAlias2() = p.MC.someName;
}

extension ExtE on p.E {
  factory EAlias() => p.E.e0;
}

extension on p.EAlias {
  factory EAlias2() => p.E.e0;
}

extension ExtET on p.ET {
  factory ETAlias(int v) => p.ET.someName(v);
}

extension on p.ETAlias {
  factory ETAlias2(int v) = p.ET.someName;
}

extension ExtG<T> on p.G<T> {
  factory GAlias() => p.G<T>.someName();
}

extension<T> on p.GAlias<T> {
  factory GAlias2() = p.G<T>.someName;
}

extension ExtCC on p.CC {
  const factory CCAlias() = p.CC.someName;
}

extension on p.CCAlias {
  const factory CCAlias2() = p.CC.someName;
}

main() {
  p.C.CAlias().expectStaticType<Exactly<p.C>>();
  p.C.CAlias2().expectStaticType<Exactly<p.C>>();

  var m1 = p.M.MAlias();
  m1.expectStaticType<Exactly<p.M>>();
  Expect.isTrue(m1 is p.MO);
  var m2 = p.M.MAlias2();
  m2.expectStaticType<Exactly<p.M>>();
  Expect.isTrue(m2 is p.MO);

  p.MC.MCAlias().expectStaticType<Exactly<p.MC>>();
  p.MC.MCAlias2().expectStaticType<Exactly<p.MC>>();

  var e1 = p.E.EAlias();
  e1.expectStaticType<Exactly<p.E>>();
  Expect.equals(p.E.e0, e1);
  var e2 = p.E.EAlias2();
  e2.expectStaticType<Exactly<p.E>>();
  Expect.equals(p.E.e0, e2);

  var et1 = p.ET.ETAlias(1);
  et1.expectStaticType<Exactly<p.ET>>();
  Expect.equals(1, et1 as int);
  var et2 = p.ET.ETAlias2(2);
  et2.expectStaticType<Exactly<p.ET>>();
  Expect.equals(2, et2 as int);

  p.G<int>.GAlias().expectStaticType<Exactly<p.G<int>>>();
  p.G<String>.GAlias2().expectStaticType<Exactly<p.G<String>>>();

  Expect.identical(const p.CC.someName(), const p.CC.CCAlias());
  Expect.identical(const p.CC.someName(), const p.CC.CCAlias2());
}
