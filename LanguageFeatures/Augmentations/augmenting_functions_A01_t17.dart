// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete function may be augmented by a
/// function with `sync*` modifier and that its body can be added by the
/// augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

Iterable<String> topLevelFunction();
augment Iterable<String> topLevelFunction() sync* {
  yield "augmented";
}

class C {
  static Iterable<String> staticMethod();
  Iterable<String> instanceMethod();
}

augment class C {
  augment static Iterable<String> staticMethod() sync* {
    yield "augmented";
  }
  augment Iterable<String> instanceMethod() sync* {
    yield "augmented";
  }
}

mixin M {
  static Iterable<String> staticMethod();
  Iterable<String> instanceMethod();
}

augment mixin M {
  augment static Iterable<String> staticMethod() sync* {
    yield "augmented";
  }
  augment Iterable<String> instanceMethod() sync* {
    yield "augmented";
  }
}

enum E {
  e0;
  static Iterable<String> staticMethod();
  Iterable<String> instanceMethod();
}

augment enum E {
  ;
  augment static Iterable<String> staticMethod() sync* {
    yield "augmented";
  }
  augment Iterable<String> instanceMethod() sync* {
    yield "augmented";
  }
}

class A {}

extension Ext on A {
  static Iterable<String> staticMethod();
  Iterable<String> instanceMethod();
}

augment extension Ext {
  augment static Iterable<String> staticMethod() sync* {
    yield "augmented";
  }
  augment Iterable<String> instanceMethod() sync* {
    yield "augmented";
  }
}

extension type ET(int _) {
  static Iterable<String> staticMethod();
  Iterable<String> instanceMethod();
}

augment extension type ET {
  augment static Iterable<String> staticMethod() sync* {
    yield "augmented";
  }
  augment Iterable<String> instanceMethod() sync* {
    yield "augmented";
  }
}

class MA = Object with M;

main() {
  Expect.equals("augmented", topLevelFunction().single);
  Expect.equals("augmented", C.staticMethod().single);
  Expect.equals("augmented", C().instanceMethod().single);
  Expect.equals("augmented", M.staticMethod().single);
  Expect.equals("augmented", MA().instanceMethod().single);
  Expect.equals("augmented", E.staticMethod().single);
  Expect.equals("augmented", E.e0.instanceMethod().single);
  Expect.equals("augmented", Ext.staticMethod().single);
  Expect.equals("augmented", A().instanceMethod().single);
  Expect.equals("augmented", ET.staticMethod().single);
  Expect.equals("augmented", ET(0).instanceMethod().single);
}
