// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with declared type ⟩. A variable
/// declaration of one of the forms
/// • static? late? T id;
/// • static? late? T id = e;
/// implicitly induces a setter with the header void set id(T x), whose
/// execution sets the value of id to the incoming argument x.
///
/// @description Checks the static type of an implicit setter of a mutable
/// variable with declared type
/// @author sgrekhov22@gmail.com

late int x1;
int? x2;
int x3 = 3;
late int x4 = 4;

class C {
  static late int v1;
  late int v2;
  int? v3;
  static int? v4;

  static late int v5 = 5;
  static int v6 = 6;
  late int v7 = 7;
  int v8 = 8;
}

main() {
  x1 = -1;
  x2 = -2;
  x3 = -3;
  x4 = -4;

  C c = C();
  C.v1 = -1;
  c.v2 = -2;
  c.v3 = -3;
  C.v4 = -4;
  C.v5 = -5;
  C.v6 = -6;
  c.v7 = -7;
  c.v8 = -8;
}
