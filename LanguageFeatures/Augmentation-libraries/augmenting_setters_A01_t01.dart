// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting with a setter: An augmenting setter can augment a
/// setter declaration, or the implicit setter of a variable declaration, with
/// all prior augmentations applied, by replacing the augmented setter’s body
/// with the augmenting setter’s body. Inside the augmenting setter’s body, an
/// `augmented = <expression>` assignment invokes the augmented setter with the
/// value of the expression.
///
/// @description Checks that an augmenting setter can augment a setter
/// declaration with all prior augmentations applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_setters_A01_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void set topLevelSetter(int v) {
  _log += "Original = $v;";
}

augment void set topLevelSetter(int v) {
  augmented = v + 1;
  _log += "Augment1 = $v;";
}

class C {
  static void set staticSetter(int v) {
    _log += "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log += "Original = $v;";
  }
}

augment class C {
  augment static void set staticSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

mixin M {
  static void set staticSetter(int v) {
    _log += "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log += "Original = $v;";
  }
}

augment mixin M {
  augment static void set staticSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

enum E {
  e0;
  static void set staticSetter(int v) {
    _log += "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log += "Original = $v;";
  }
}

augment enum E {
  augment e0;
  augment static void set staticSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

class A {}

extension Ext on A {
  static void set staticSetter(int v) {
    _log += "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log += "Original = $v;";
  }
}

augment extension Ext {
  augment static void set staticSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

extension type ET(int _) {
  static void set staticSetter(int v) {
    _log += "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log += "Original = $v;";
  }
}

augment extension type ET(int _) {
  augment static void set staticSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceSetter(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

class MA = Object with M;

main() {
  topLevelSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  C.staticSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  C().instanceSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  M.staticSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  M().instanceSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  E.staticSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  E.e0.instanceSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  Ext.staticSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  A().instanceSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  ET.staticSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
  ET(0).instanceSetter = 0;
  Expect.equals("Original = 2;Augment1 = 1;Augment2 = 0;", _log);
  _log = "";
}
