// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is no error if an augmenting declaration
/// specifies the same formal parameter type as the introductory declaration
/// does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'type_inheritance_A04_t03_lib.dart';

String _log = "";

void topLevelFunction(var v) {
  if (1 > 2) v.memberThatDoesNotExist; // To check that the type is dynamic
  _log = "Original $v";
}
void set topLevelSetter(final v) {
  if (1 > 2) v.memberThatDoesNotExist;
  _log = "Original $v";
}

class C {
  static void staticMethod(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  static void set staticSetter(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void instanceMethod(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void set instanceSetter(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
}

mixin M {
  static void staticMethod(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  static void set staticSetter(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void instanceMethod(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void set instanceSetter(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
}

enum E {
  e0;
  static void staticMethod(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  static void set staticSetter(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void instanceMethod(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void set instanceSetter(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
}

class A {}

extension Ext on A {
  static void staticMethod(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  static void set staticSetter(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void instanceMethod(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void set instanceSetter(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
}

extension type ET(int id) {
  static void staticMethod(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  static void set staticSetter(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void instanceMethod(var v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
  void set instanceSetter(final v) {
    if (1 > 2) v.memberThatDoesNotExist;
    _log = "Original $v";
  }
}

class MA = Object with M;

main() {
  topLevelFunction("x");
  Expect.equals("Original x", _log);
  topLevelSetter = "x";
  Expect.equals("Original x", _log);
  C.staticMethod("x");
  Expect.equals("Original x", _log);
  C.staticSetter = "x";
  Expect.equals("Original x", _log);
  C().instanceMethod("x");
  Expect.equals("Original x", _log);
  C().instanceSetter = "x";
  Expect.equals("Original x", _log);
  M.staticMethod("x");
  Expect.equals("Original x", _log);
  M.staticSetter = "x";
  Expect.equals("Original x", _log);
  MA().instanceMethod("x");
  Expect.equals("Original x", _log);
  MA().instanceSetter = "x";
  Expect.equals("Original x", _log);
  E.staticMethod("x");
  Expect.equals("Original x", _log);
  E.staticSetter = "x";
  Expect.equals("Original x", _log);
  E.e0.instanceMethod("x");
  Expect.equals("Original x", _log);
  E.e0.instanceSetter = "x";
  Expect.equals("Original x", _log);
  Ext.staticMethod("x");
  Expect.equals("Original x", _log);
  Ext.staticSetter = "x";
  Expect.equals("Original x", _log);
  A().instanceMethod("x");
  Expect.equals("Original x", _log);
  A().instanceSetter = "x";
  Expect.equals("Original x", _log);
  ET.staticMethod("x");
  Expect.equals("Original x", _log);
  ET.staticSetter = "x";
  Expect.equals("Original x", _log);
  ET(0).instanceMethod("x");
  Expect.equals("Original x", _log);
  ET(0).instanceSetter = "x";
  Expect.equals("Original x", _log);
}
