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
/// @description Checks that an incomplete setter may be augmented by a complete
/// augmenting setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String log = "";

void set topLevelSetter(String v);
augment void set topLevelSetter(String v) {
  log = v;
}

class C {
  static void set staticSetter(String _);
  void set instanceSetter(String v);
}

augment class C {
  augment static void set staticSetter(String v) {
    log = s;
  }
  augment void set instanceSetter(String v) {
    log = v;
  }
}

mixin M {
  static void set staticSetter(String v);
  void set instanceSetter(String _);
}

augment mixin M {
  augment static void set staticSetter(String v) {
    log = s;
  }
  augment void set instanceSetter(String v) {
    log = v;
  }
}

enum E {
  e0;
  static void set staticSetter(String _);
  void set instanceSetter(String v);
}

augment enum E {
  ;
  augment static void set staticSetter(String v) {
    log = s;
  }
  augment void set instanceSetter(String v) {
    log = v;
  }
}

class A {}

extension Ext on A {
  static void set staticSetter(String v);
  void set instanceSetter(String _);
}

augment extension Ext {
  augment static void set staticSetter(String v) {
    log = s;
  }
  augment void set instanceSetter(String v) {
    log = v;
  }
}

extension type ET(int _) {
  static void set staticSetter(String v);
  void set instanceSetter(String _);
}

augment extension type ET {
  augment static void set staticSetter(String v) {
    log = s;
  }
  augment void set instanceSetter(String v) {
    log = v;
  }
}

class MA = Object with M;

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  topLevelSetter = "a";
  checkLog("a");
  C.staticSetter = "b";
  checkLog("b");
  C().instanceSetter = "c";
  checkLog("c");
  M.staticSetter = "d";
  checkLog("d");
  MA().instanceSetter = "e";
  checkLog("e");
  E.staticSetter = "f";
  checkLog("f");
  E.e0.instanceSetter = "g";
  checkLog("g");
  Ext.staticSetter = "h";
  checkLog("h");
  A().instanceSetter = "i";
  checkLog("i");
  ET.staticSetter = "j";
  checkLog("j");
  ET(0).instanceSetter = "k";
  checkLog("k");
}
