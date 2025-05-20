// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the `extends` keyword. For a variable
/// or parameter, a `var` keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a formal parameter type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'type_inheritance_A01_t04_lib.dart';

String _log = "";

void topLevelFunction1({String v = ""});

void topLevelFunction2({required String v = ""}) {
  _log = "Original $v";
}
void topLevelFunction3([String v = ""]);

class C {
  static void staticMethod([final String v = ""]);

  void instanceMethod({required String v}) {
    _log = "Original $v";
  }
}

mixin M {
  static void staticMethod([final String v = ""]);

  void instanceMethod({final String v = ""}) {
    _log = "Original $v";
  }
}

enum E {
  e0;
  static void staticMethod({final String v = ""}) {
    _log = "Original $v";
  }
  void instanceMethod([String v = ""]);
}

class A {}

extension Ext on A {
  static void staticMethod([String v = ""]);
  void instanceMethod({required final String v}) {
    _log = "Original $v";
  }
}

extension type ET(int id) {
  static void staticMethod({required final String v});
  void instanceMethod([String v = ""]) {
    _log = "Original $v";
  }
}

class MA = Object with M;

main() {
  topLevelFunction1();
  Expect.equals("Augmented ", _log);
  topLevelFunction2(v: "x");
  Expect.equals("Original x", _log);
  topLevelFunction3();
  Expect.equals("Augmented ", _log);

  C.staticMethod("x");
  Expect.equals("Augmented x", _log);
  C().instanceMethod(v: "x");
  Expect.equals("Original x", _log);

  M.staticMethod("x");
  Expect.equals("Augmented x", _log);
  MA().instanceMethod(v: "x");
  Expect.equals("Original x", _log);

  E.staticMethod(v: "x");
  Expect.equals("Original x", _log);
  E.e0.instanceMethod("x");
  Expect.equals("Augmented x", _log);

  Ext.staticMethod("x");
  Expect.equals("Augmented x", _log);
  A().instanceMethod(v: "x");
  Expect.equals("Original x", _log);

  ET.staticMethod(v: "x");
  Expect.equals("Augmented x", _log);
  ET(0).instanceMethod("x");
  Expect.equals("Original x", _log);
}
