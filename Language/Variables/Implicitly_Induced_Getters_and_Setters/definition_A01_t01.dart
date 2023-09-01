// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Getter: Variable with declared type ⟩. Consider a variable
/// declaration of one of the forms
/// • static? late? final? T id;
/// • static? late? final? T id = e;
/// • static? const T id = e;
/// where T is a type, id is an identifier, and ‘?’ indicates that the given
/// modifier may be present or absent. Each of these declarations implicitly
/// induces a getter with the header T get id.
/// ...
/// In these cases the declared type of id is T.
///
/// @description Checks that the static type of an implicit getter is its
/// declared type
/// @author sgrekhov22@gmail.com

import "../../../Utils/static_type_helper.dart";

late final int? x1;
late int x2;
int? x3;
late final int x4 = 4;
late int x5 = 5;
final int x6 = 6;
int x7 = 7;
const int x8 = 8;

class C {
  static late final int v11;
  static late int v12;
  late int v13;
  int? v14;
  late final int v15;
  late int v16;

  static late final int v21 = 21;
  static late int v22 = 22;
  static int v23 = 23;
  static final int v24 = 24;
  late final int v25 = 25;
  late int v26 = 26;
  final int v27 = 27;
  int v28 = 28;

  static const int v31 = 31;
}

main() {
  x1 = 1 as dynamic;
  x1.expectStaticType<Exactly<int?>>();
  x2.expectStaticType<Exactly<int>>();
  x3.expectStaticType<Exactly<int?>>();
  x4.expectStaticType<Exactly<int>>();
  x5.expectStaticType<Exactly<int>>();
  x6.expectStaticType<Exactly<int>>();

  C c = C();
  C.v11 = 11 as dynamic;
  C.v12 = 12  as dynamic;
  c.v13 = 13 as dynamic;
  c.v14 = 14 as dynamic;
  c.v15 = 15  as dynamic;
  c.v16 = 16 as dynamic;
  C.v11.expectStaticType<Exactly<int>>();
  C.v12.expectStaticType<Exactly<int>>();
  c.v13.expectStaticType<Exactly<int>>();
  c.v14.expectStaticType<Exactly<int?>>();
  c.v15.expectStaticType<Exactly<int>>();
  c.v16.expectStaticType<Exactly<int>>();
  C.v21.expectStaticType<Exactly<int>>();
  C.v22.expectStaticType<Exactly<int>>();
  C.v23.expectStaticType<Exactly<int>>();
  C.v24.expectStaticType<Exactly<int>>();
  c.v25.expectStaticType<Exactly<int>>();
  c.v26.expectStaticType<Exactly<int>>();
  c.v27.expectStaticType<Exactly<int>>();
  c.v28.expectStaticType<Exactly<int>>();
  C.v31.expectStaticType<Exactly<int>>();
}
