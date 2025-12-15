// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not final, or is late without an initializer,
/// then the variable declaration also implicitly defines a setter with a
/// parameter named `_` whose type is the type of the variable.
///
/// If the variable is abstract, then the getter and setter are incomplete,
/// otherwise they are complete. For non-abstract variables, the compiler
/// synthesizes a getter that accesses the backing storage and a setter that
/// updates it, so these members have bodies.
///
/// A getter can be augmented by another getter, and likewise a setter can be
/// augmented by a setter. This is true whether the getter or setter is
/// explicitly declared or implicitly declared using a variable declaration.
///
/// @description Checks that a setter may be augmented by an implicitly defined
/// augmenting setter (abstract variable).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String log = "";

void set topLevelSetter(String s) {
  log = s;
}

augment abstract String topLevelSetter;

class C {
  void set instanceSetter(String s) {
    log = s;
  }
}

augment class C {
  augment abstract String instanceSetter;
}

mixin M {
  void set instanceSetter(String s) {
    log = s;
  }
}

augment mixin M {
  augment abstract String instanceSetter;
}

enum E {
  e0;
  void set instanceSetter(String s) {
    log = s;
  }
}

augment enum E {
  ;
  augment abstract String instanceSetter;
}

class A {}

extension Ext on A {
  void set instanceSetter(String s) {
    log = s;
  }
}

augment extension Ext {
  augment abstract String instanceSetter;
}

extension type ET(int _) {
  void set instanceSetter(String s) {
    log = s;
  }
}

augment extension type ET {
  augment abstract String instanceSetter;
}

class MA = Object with M;

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  topLevelSetter = "a";
  checkLog("a");
  C().instanceSetter = "c";
  checkLog("c");
  MA().instanceSetter = "e";
  checkLog("e");
  E.e0.instanceSetter = "g";
  checkLog("g");
  A().instanceSetter = "i";
  checkLog("i");
  ET(0).instanceSetter = "k";
  checkLog("k");
}
