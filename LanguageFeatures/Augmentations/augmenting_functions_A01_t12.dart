// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete operator may be augmented, and that
/// its body can be added by the augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class A {}

class C {
  String operator +(String other);
}

augment class C {
  augment String operator +(String other) {
    return "C:$other";
  }
}

mixin M {
  String operator +(String other);
}

augment mixin M {
  augment String operator +(String other) {
    return "M:$other";
  }
}

enum E {
  e1;

  String operator +(String other);
}

augment enum E {
  ;
  augment String operator +(String other) {
    return "E:$other";
  }
}

extension Ext on A {
  String operator +(String other);
}

augment extension Ext {
  augment String operator +(String other) {
    return "Ext:$other";
  }
}

extension type ET(String v) {
  String operator +(String other);
}

augment extension type ET {
  augment String operator +(String other) {
    return "ET:$other";
  }
}

class MA = Object with M;

main() {
  Expect.equals("C:A", C() + "A");
  Expect.equals("M:B", MA() + "B");
  Expect.equals("E:C", E.e1 + "C");
  Expect.equals("Ext:D", A() + "D");
  Expect.equals("ET:E", ET(0) + "E");
}
