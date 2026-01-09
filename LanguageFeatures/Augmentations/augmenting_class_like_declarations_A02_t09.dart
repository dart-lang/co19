// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that a class, mixin, enum and extension type
/// augmentation may specify additional elements for the `implements` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

abstract class I0 {
  String get id0;
}

class I1 implements I0 {
  String get id0 => "I1";
  String get id1 => "I1";
}

interface class I2 extends I1 {
  String get id2 => "I2";
}

class C implements I1 {
  String get id0 => "C";
  String get id1 => "C";
}

augment class C implements I2 {
  String get id2 => "I2 from C";
}

mixin M implements I1 {
  String get id0 => "M";
  String get id1 => "M";
}

augment mixin M implements I2 {
  String get id2 => "I2 from M";
}

enum E implements I1 {
  e1;
  String get id0 => "E";
  String get id1 => "E";
}

augment enum E implements I2 {
  ;
  String get id2 => "I2 from E";
}

extension type ET(I2 v) implements I1 {
  String get id0 => "ET";
  String get id1 => "ET";
}

augment extension type ET implements I2 {
  String get id2 => "I2 from ET";
}

class MA = Object with M;

main() {
  I1 c1 = C();
  I1 m1 = MA();
  I1 e1 = E.e1;
  ET et1 = ET(I2());
  Expect.equals("C", c1.id1);
  Expect.equals("M", m1.id1);
  Expect.equals("E", e1.id1);
  Expect.equals("ET", et1.id1);

  I2 c2 = C();
  I2 m2 = MA();
  I2 e2 = E.e1;
  ET et2 = ET(I2());
  Expect.equals("I2 from C", c2.id2);
  Expect.equals("I2 from M", m2.id2);
  Expect.equals("I2 from E", e2.id2);
  Expect.equals("I2 from ET", et2.id2);
}
