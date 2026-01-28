// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
/// It is allowed to augment a complete declaration as long as the augmentation
/// itself is incomplete. This can be useful for an augmentation to add metadata.
///
/// @description Checks that a complete async function with `async*` modifier
/// may be augmented by an incomplete (abstract) function declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:async';
import '../../Utils/expect.dart';

Stream<String> topLevelFunction() async* {
  yield "intro";
}
augment Stream<String> topLevelFunction();

class C {
  static Stream<String> staticMethod() async* {
    yield "intro";
  }
  Stream<String> instanceMethod() async* {
    yield "intro";
  }
}

augment class C {
  augment static Stream<String> staticMethod();
  augment Stream<String> instanceMethod();
}

mixin M {
  static Stream<String> staticMethod() async* {
    yield "intro";
  }
  Stream<String> instanceMethod() async* {
    yield "intro";
  }
}

augment mixin M {
  augment static Stream<String> staticMethod();
  augment Stream<String> instanceMethod();
}

enum E {
  e0;
  static Stream<String> staticMethod() async* {
    yield "intro";
  }
  Stream<String> instanceMethod() async* {
    yield "intro";
  }
}

augment enum E {
  ;
  augment static Stream<String> staticMethod();
  augment Stream<String> instanceMethod();
}

class A {}

extension Ext on A {
  static Stream<String> staticMethod() async* {
    yield "intro";
  }
  Stream<String> instanceMethod() async* {
    yield "intro";
  }
}

augment extension Ext {
  augment static Stream<String> staticMethod();
  augment Stream<String> instanceMethod();
}

extension type ET(int _) {
  static Stream<String> staticMethod() async* {
    yield "intro";
  }
  Stream<String> instanceMethod() async* {
    yield "intro";
  }
}

augment extension type ET {
  augment static Stream<String> staticMethod();
  augment Stream<String> instanceMethod();
}

class MA = Object with M;

main() async {
  Expect.equals("intro", await topLevelFunction().single);
  Expect.equals("intro", await C.staticMethod().single);
  Expect.equals("intro", await C().instanceMethod().single);
  Expect.equals("intro", await M.staticMethod().single);
  Expect.equals("intro", await MA().instanceMethod().single);
  Expect.equals("intro", await E.staticMethod().single);
  Expect.equals("intro", await E.e0.instanceMethod().single);
  Expect.equals("intro", await Ext.staticMethod().single);
  Expect.equals("intro", await A().instanceMethod().single);
  Expect.equals("intro", await ET.staticMethod().single);
  Expect.equals("intro", await ET(0).instanceMethod().single);
}
