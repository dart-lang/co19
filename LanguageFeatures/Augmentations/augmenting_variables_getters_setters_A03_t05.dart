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
/// @description Checks that an incomplete implicit setter (abstract variable)
/// may be augmented by an augmenting setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String log = "";

abstract String topLevelVariable;
augment void set topLevelVariable(String v) {
  log = v;
}
augment String get topLevelVariable => ""; // We also need a getter to complete the declaration

class C {
  static abstract String staticVariable;
  augment static void set staticVariable(String v) {
    log = v;
  }
  augment static String get staticVariable => "";

  abstract String instanceVariable;
  augment void set instanceVariable(String v) {
    log = v;
  }
  augment String get instanceVariable => "";
}

mixin M {
  static abstract String staticVariable;
  augment static void set staticVariable(String v) {
    log = v;
  }
  augment static String get staticVariable => "";

  abstract String instanceVariable;
  augment void set instanceVariable(String v) {
    log = v;
  }
  augment String get instanceVariable => "";
}

enum E {
  e0;
  static abstract String staticVariable;
  augment static void set staticVariable(String v) {
    log = v;
  }
  augment static String get staticVariable => "";

  abstract String instanceVariable;
  augment void set instanceVariable(String v) {
    log = v;
  }
  augment String get instanceVariable => "";
}

class A {}

extension Ext on A {
  static abstract String staticVariable;
  augment static void set staticVariable(String v) {
    log = v;
  }
  augment static String get staticVariable => "";

  abstract String instanceVariable;
  augment void set instanceVariable(String v) {
    log = v;
  }
  augment String get instanceVariable => "";
}

extension type ET(int _) {
  static abstract String staticVariable;
  augment static void set staticVariable(String v) {
    log = v;
  }
  augment static String get staticVariable => "";

  abstract String instanceVariable;
  augment void set instanceVariable(String v) {
    log = v;
  }
  augment String get instanceVariable => "";
}

class MA = Object with M;

void checkLog(String expected) {
  Expect.equals(expected, log);
  log = "";
}

main() {
  topLevelVariable = "a";
  checkLog("a");
  C.staticVariable = "b";
  checkLog("b");
  C().instanceVariable = "c";
  checkLog("c");
  M.staticVariable = "d";
  checkLog("d");
  MA().instanceVariable = "e";
  checkLog("e");
  E.staticVariable = "f";
  checkLog("f");
  E.e0.instanceVariable = "g";
  checkLog("g");
  Ext.staticVariable = "h";
  checkLog("h");
  A().instanceVariable = "i";
  checkLog("i");
  ET.staticVariable = "j";
  checkLog("j");
  ET(0).instanceVariable = "k";
  checkLog("k");
}
