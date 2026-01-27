// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that augmentation adds mixins in least to greatest order
/// using the after relation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'augmenting_class_like_declarations_A02_t26_lib.dart';

String log = "";

class A {
  void foo() {
    log += "A;";
  }
}

mixin M1 on A {
  void foo() {
    super.foo();
    log += "M1;";
  }
}

mixin M2 on A {
  void foo() {
    super.foo();
    log += "M2;";
  }
}

mixin M3 on A {
  void foo() {
    super.foo();
    log += "M3;";
  }
}

class C1 extends A {}
class C2 extends A with M1 {}
class C3 extends A {}

augment class C1 with M1 {}
augment class C1 with M2 {}

augment class C2 with M2 {}
augment class C2 with M3 {}

augment class C3 with M3 {}
augment class C3 with M2 {}

main() {
  C1().foo();
  Expect.equals("A;M1;M2;", log);
  log = "";
  C2().foo();
  Expect.equals("A;M1;M2;M3;", log);
  log = "";
  C3().foo();
  Expect.equals("A;M3;M2;M1;", log);
}
