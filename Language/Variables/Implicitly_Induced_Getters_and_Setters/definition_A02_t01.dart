// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Getter: Variable with no declared type ⟩. A variable
/// declaration of one of the forms
/// • static? late? var id;
/// • static? late? var id = e;
/// • static? late? final id;
/// • static? late? final id = e;
/// • static? const id = e;
/// implicitly induces a getter with the header that contains static iff the
/// declaration contains static and is followed by T get id, where T is obtained
/// from type inference in the case where e exists, and T is dynamic otherwise.
/// ...
/// In these cases, the declared type of id is T
///
/// @description Checks the static type of an implicit getter of a variable with
/// no declared type
/// @author sgrekhov22@gmail.com

import "../../../Utils/static_type_helper.dart";

late var x1;
var x2;
late var x3 = 3;
var x4 = 4;

late final x5;
late final x6 = 6;
final x7 = 7;

const x8 = 8;

class C {
  static late var v1;
  late var v2;
  var v3;
  static var v4;

  static late var v5 = 5;
  static var v6 = 6;
  late var v7 = 7;
  var v8 = 8;

  static late final v10;
  late final v11;

  static late final v12 = 12;
  static final v13 = 13;
  late final v14 = 14;
  final v15 = 15;

  static const v20 = 20;
}

main() {
  try {
    x1.whatever;
  } catch (_) {}
  try {
    x2.whatever;
  } catch (_) {}
  x3.expectStaticType<Exactly<int>>();
  x4.expectStaticType<Exactly<int>>();

  try {
    x5.whatever;
  } catch (_) {}
  x6.expectStaticType<Exactly<int>>();
  x7.expectStaticType<Exactly<int>>();
  x8.expectStaticType<Exactly<int>>();

  C c = C();
  try {
    C.v1.whatever;
  } catch (_) {}
  try {
    c.v2.whatever;
  } catch (_) {}
  try {
    c.v3.whatever;
  } catch (_) {}
  try {
    C.v4.whatever;
  } catch (_) {}
  C.v5.expectStaticType<Exactly<int>>();
  C.v6.expectStaticType<Exactly<int>>();
  c.v7.expectStaticType<Exactly<int>>();
  c.v8.expectStaticType<Exactly<int>>();

  try {
    C.v10.whatever;
  } catch (_) {}
  try {
    c.v11.whatever;
  } catch (_) {}
  C.v12.expectStaticType<Exactly<int>>();
  C.v13.expectStaticType<Exactly<int>>();
  c.v14.expectStaticType<Exactly<int>>();
  c.v15.expectStaticType<Exactly<int>>();
  C.v20.expectStaticType<Exactly<int>>();
}
