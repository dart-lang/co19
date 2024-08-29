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
/// @description Checks that an augmenting setter can augment a variable
/// declaration with all prior augmentations applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_setters_A01_t02_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

int topLevelVariable = -1;

augment void set topLevelVariable(int v) {
  augmented = v + 1;
  _log += "Augment1 = $v;";
}

class C {
  static int staticVariable = -1;
  int instanceVariable = -1;
}

augment class C {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

mixin M {
  static int staticVariable = -1;
  int instanceVariable = -1;
}

augment mixin M {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

enum E {
  e0;
  static int staticVariable = -1;
}

augment enum E {
  augment e0;
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

class A {}

extension Ext on A {
  static int staticVariable = -1;
}

augment extension Ext {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

extension type ET(int _) {
  static int staticVariable = -1;
}

augment extension type ET {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

class MA = Object with M;

main() {
  topLevelVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, topLevelVariable);
  _log = "";

  C.staticVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, C.staticVariable);
  _log = "";
  C().instanceVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, C().instanceVariable);
  _log = "";

  M.staticVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, M.staticVariable);
  _log = "";
  MA().instanceVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, MA().instanceVariable);
  _log = "";

  E.staticVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, E.staticVariable);
  _log = "";

  Ext.staticVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, Ext.staticVariable);
  _log = "";

  ET.staticVariable = 0;
  Expect.equals("Augment1 = 1;Augment2 = 0;", _log);
  Expect.equals(2, ET.staticVariable);
  _log = "";
}
