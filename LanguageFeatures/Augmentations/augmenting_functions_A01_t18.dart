// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
/// It is allowed to augment a complete declaration as long as the augmentation
/// itself is incomplete. This can be useful for an augmentation to add metadata.
///
/// @description Checks that a complete `sync*` function may be augmented by an
/// incomplete (abstract) function declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

Iterable<String> topLevelFunction() sync* {
  yield "intro";
}
augment Iterable<String> topLevelFunction();

class C {
  static Iterable<String> staticMethod() sync* {
    yield "intro";
  }
  Iterable<String> instanceMethod() sync* {
    yield "intro";
  }
}

augment class C {
  augment static Iterable<String> staticMethod();
  augment Iterable<String> instanceMethod();
}

mixin M {
  static Iterable<String> staticMethod() sync* {
    yield "intro";
  }
  Iterable<String> instanceMethod() sync* {
    yield "intro";
  }
}

augment mixin M {
  augment static Iterable<String> staticMethod();
  augment Iterable<String> instanceMethod();
}

enum E {
  e0;
  static Iterable<String> staticMethod() sync* {
    yield "intro";
  }
  Iterable<String> instanceMethod() sync* {
    yield "intro";
  }
}

augment enum E {
  ;
  augment static Iterable<String> staticMethod();
  augment Iterable<String> instanceMethod();
}

class A {}

extension Ext on A {
  static Iterable<String> staticMethod() sync* {
    yield "intro";
  }
  Iterable<String> instanceMethod() sync* {
    yield "intro";
  }
}

augment extension Ext {
  augment static Iterable<String> staticMethod();
  augment Iterable<String> instanceMethod();
}

extension type ET(int _) {
  static Iterable<String> staticMethod() sync* {
    yield "intro";
  }
  Iterable<String> instanceMethod() sync* {
    yield "intro";
  }
}

augment extension type ET {
  augment static Iterable<String> staticMethod();
  augment Iterable<String> instanceMethod();
}

class MA = Object with M;

main() {
  Expect.equals("intro", topLevelFunction().single);
  Expect.equals("intro", C.staticMethod().single);
  Expect.equals("intro", C().instanceMethod().single);
  Expect.equals("intro", M.staticMethod().single);
  Expect.equals("intro", MA().instanceMethod().single);
  Expect.equals("intro", E.staticMethod().single);
  Expect.equals("intro", E.e0.instanceMethod().single);
  Expect.equals("intro", Ext.staticMethod().single);
  Expect.equals("intro", A().instanceMethod().single);
  Expect.equals("intro", ET.staticMethod().single);
  Expect.equals("intro", ET(0).instanceMethod().single);
}
