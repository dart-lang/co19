// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an incomplete function may be augmented by an async
/// function with `async*` modifier and that its body can be added by the
/// augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:async';
import '../../Utils/expect.dart';

Stream<String> topLevelFunction();
augment Stream<String> topLevelFunction() async* {
  yield "augmented";
}

class C {
  static Stream<String> staticMethod();
  Stream<String> instanceMethod();
}

augment class C {
  augment static Stream<String> staticMethod() async* {
    yield "augmented";
  }
  augment Stream<String> instanceMethod() async* {
    yield "augmented";
  }
}

mixin M {
  static Stream<String> staticMethod();
  Stream<String> instanceMethod();
}

augment mixin M {
  augment static Stream<String> staticMethod() async* {
    yield "augmented";
  }
  augment Stream<String> instanceMethod() async* {
    yield "augmented";
  }
}

enum E {
  e0;
  static Stream<String> staticMethod();
  Stream<String> instanceMethod();
}

augment enum E {
  ;
  augment static Stream<String> staticMethod() async* {
    yield "augmented";
  }
  augment Stream<String> instanceMethod() async* {
    yield "augmented";
  }
}

class A {}

extension Ext on A {
  static Stream<String> staticMethod();
  Stream<String> instanceMethod();
}

augment extension Ext {
  augment static Stream<String> staticMethod() async* {
    yield "augmented";
  }
  augment Stream<String> instanceMethod() async* {
    yield "augmented";
  }
}

extension type ET(int _) {
  static Stream<String> staticMethod();
  Stream<String> instanceMethod();
}

augment extension type ET {
  augment static Stream<String> staticMethod() async* {
    yield "augmented";
  }
  augment Stream<String> instanceMethod() async* {
    yield "augmented";
  }
}

class MA = Object with M;

main() async {
  Expect.equals("augmented", await topLevelFunction().single);
  Expect.equals("augmented", await C.staticMethod().single);
  Expect.equals("augmented", await C().instanceMethod().single);
  Expect.equals("augmented", await M.staticMethod().single);
  Expect.equals("augmented", await MA().instanceMethod().single);
  Expect.equals("augmented", await E.staticMethod().single);
  Expect.equals("augmented", await E.e0.instanceMethod().single);
  Expect.equals("augmented", await Ext.staticMethod().single);
  Expect.equals("augmented", await A().instanceMethod().single);
  Expect.equals("augmented", await ET.staticMethod().single);
  Expect.equals("augmented", await ET(0).instanceMethod().single);
}
