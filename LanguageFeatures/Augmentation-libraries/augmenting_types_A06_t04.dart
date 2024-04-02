// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that a class, extension type, mixin and enum augment may
/// specify an additional `implements` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
import augment 'augmenting_types_A06_t04_lib.dart';

abstract class I0 {
  String get id0;
}

class I1 impelements I0 {
  String get id0 => "I1";
  String get id1 => "I1";
}

class C implements I1 {
  String get id1 => "C";
}

mixin M implements I1 {
  String get id1 => "M";
}

extension type ET(I1 _) implements I1 {}

enum E implements I1 {
  e1;
  String get id1 => "E";
}

class MA = Object with M;

main() {
  I1 c1 = C();
  I1 et1 = ET(I1());
  I1 m1 = MA();
  I1 e1 = E.e1;
  Expect.equals("C", c1.id1);
  Expect.equals("I1", et1.id1);
  Expect.equals("M", m1.id1);
  Expect.equals("E", e1.id1);

  I2 c2 = C();
  I2 et2 = ET(I1());
  I2 m2 = MA();
  I2 e2 = E.e1;
  Expect.equals("I2 from C", c2.id2);
  Expect.equals("I0 from ET", et2.id0);
  Expect.equals("I2 from M", m2.id2);
  Expect.equals("I2 from E", e2.id2);
}
