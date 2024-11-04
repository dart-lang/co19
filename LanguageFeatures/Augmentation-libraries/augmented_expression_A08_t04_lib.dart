// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that the identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting. In this case, the
/// identifier is taken to be a reference to a declaration which is in scope.
///
/// @description Checks that if an identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting then the identifier is
/// taken to be a reference to a declaration which is in scope. Test a setter
/// named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A08_t04.dart';

void topLevelFunction() {
  augmented = "topLevelFunction";
}

class C {
  static void staticMethod() {
    augmented = "C.staticMethod";
  }
  void instanceMethod() {
    augmented = "C.instanceMethod";
  }
}

mixin M {
  static void staticMethod() {
    augmented = "M.staticMethod";
  }
  void instanceMethod() {
    augmented = "M.instanceMethod";
  }
}

class MA = Object with M;

enum E {
  e1;

  static void staticMethod() {
    augmented = "E.staticMethod";
  }
  void instanceMethod() {
    augmented = "E.instanceMethod";
  }
}

extension Ext on A {
  static void staticMethod() {
    augmented = "Ext.staticMethod";
  }
  void instanceMethod() {
    augmented = "Ext.instanceMethod";
  }
}

extension type ET(int _) {
  static void staticMethod() {
    augmented = "ET.staticMethod";
  }
  void instanceMethod() {
    augmented = "ET.instanceMethod";
  }
}
