// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An ⟨initializedVariableDeclaration⟩ that declares two or more
/// variables is equivalent to multiple variable declarations declaring the same
/// set of variable names, in the same order, with the same initialization,
/// type, and modifiers
///
/// @description Checks that two or more variables is equivalent to multiple
/// variable declarations declaring the same set of variable names, in the same
/// order, with the same initialization, type, and modifiers
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

var v1 = 1, v2, v3 = "3";
int? i1 = 1, i2, i3 = i1;
final int fi1 = 1, fi2 = fi1, fi3 = fi2;

class C {
  static var s1 = 1, s2, s3 = "3";
  static int? si1 = 1, si2, si3 = si1;
  static final int sfi1 = 1, sfi2 = sfi1, sfi3 = sfi2;

  var _v1 = 1, _v2, _v3 = "3";
  int? _i1 = 1, _i2, _i3 = 3;
  final int _fi1 = 1, _fi2 = 2;
}

main() {
  var lv1 = 1, lv2, lv3 = "3";
  int? li1 = 1, li2, li3 = li1;
  final int lfi1 = 1, lfi2 = lfi1, lfi3 = lfi2;

  Expect.equals(1, v1);
  Expect.isNull(v2);
  Expect.equals("3", v3);
  Expect.equals(1, i1);
  Expect.isNull(i2);
  Expect.equals(1, i3);
  Expect.equals(1, fi1);
  Expect.equals(1, fi1);
  Expect.equals(1, fi3);

  Expect.equals(1, C.s1);
  Expect.isNull(C.s2);
  Expect.equals("3", C.s3);
  Expect.equals(1, C.si1);
  Expect.isNull(C.si2);
  Expect.equals(1, C.si3);
  Expect.equals(1, C.sfi1);
  Expect.equals(1, C.sfi1);
  Expect.equals(1, C.sfi3);

  C c = C();
  Expect.equals(1, c._v1);
  Expect.isNull(c._v2);
  Expect.equals("3", c._v3);
  Expect.equals(1, c._i1);
  Expect.isNull(c._i2);
  Expect.equals(3, c._i3);
  Expect.equals(1, c._fi1);
  Expect.equals(1, c._fi1);

  Expect.equals(1, lv1);
  Expect.isNull(lv2);
  Expect.equals("3", lv3);
  Expect.equals(1, li1);
  Expect.isNull(li2);
  Expect.equals(1, li3);
  Expect.equals(1, lfi1);
  Expect.equals(1, lfi1);
  Expect.equals(1, lfi3);
}
