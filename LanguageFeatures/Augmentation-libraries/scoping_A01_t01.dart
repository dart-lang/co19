// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a member declaration needs to reference a static or instance
/// member declared in another introductory or augmenting declaration of the
/// same type, it can use `this.name` for instance members an `TypeName.name`
/// for static members to be absolutely sure. Or it can rely on the default if
/// `name` is not in the lexical scope at all, in which case it’s interpreted as
/// `this.name` if it occurs inside a scope where a `this` is available.
///
/// @description Checks that it is possible to use `this.name` and
/// `TypeName.name` for referencing declarations in another introductory or
/// augmenting declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'scoping_A01_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

const introductoryStatic = "Should not be used!";
String get introductoryStaticGetter => "Should not be used!";
void set introductoryStaticSetter(String _) {
  _log = "Should not be used!";
}
String introductoryStaticMethod() => "Should not be used!";

const introductoryInstance = "Should not be used!";
String get introductoryGetter => "Should not be used!";
void set introductorySetter(String _) {
  _log = "Should not be used!";
}
String introductoryMethod() => "Should not be used!";

class C {
  static const introductoryStatic = "introductoryStatic";
  static String get introductoryStaticGetter => "introductoryStaticGetter";
  static void set introductoryStaticSetter(String _) {
    _log = "introductoryStaticSetter";
  }
  static String introductoryStaticMethod() => "introductoryStaticMethod";

  String introductoryInstance = "introductoryInstance";
  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {
    _log = "introductorySetter";
  }
  String introductoryMethod() => "introductoryMethod";

  void testAugmenting() {
    Expect.equals("augmentingStatic", C.augmentingStatic);
    Expect.equals("augmentingStaticGetter", C.augmentingStaticGetter);
    C.augmentingStaticSetter = "";
    Expect.equals("augmentingStaticSetter", _log);
    Expect.equals("augmentingStaticMethod", C.augmentingStaticMethod());

    Expect.equals("augmentingInstance", this.augmentingInstance);
    Expect.equals("augmentingGetter", this.augmentingGetter);
    this.augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", this.augmentingMethod());
  }
}

mixin M {
  static const introductoryStatic = "introductoryStatic";
  static String get introductoryStaticGetter => "introductoryStaticGetter";
  static void set introductoryStaticSetter(String _) {
    _log = "introductoryStaticSetter";
  }
  static String introductoryStaticMethod() => "introductoryStaticMethod";

  String introductoryInstance = "introductoryInstance";
  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {
    _log = "introductorySetter";
  }
  String introductoryMethod() => "introductoryMethod";

  void testAugmenting() {
    Expect.equals("augmentingStatic", M.augmentingStatic);
    Expect.equals("augmentingStaticGetter", M.augmentingStaticGetter);
    M.augmentingStaticSetter = "";
    Expect.equals("augmentingStaticSetter", _log);
    Expect.equals("augmentingStaticMethod", M.augmentingStaticMethod());

    Expect.equals("augmentingInstance", this.augmentingInstance);
    Expect.equals("augmentingGetter", this.augmentingGetter);
    this.augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", this.augmentingMethod());
  }
}

enum E {
  e0;
  static const introductoryStatic = "introductoryStatic";
  static String get introductoryStaticGetter => "introductoryStaticGetter";
  static void set introductoryStaticSetter(String _) {
    _log = "introductoryStaticSetter";
  }
  static String introductoryStaticMethod() => "introductoryStaticMethod";

  final String introductoryInstance = "introductoryInstance";
  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {
    _log = "introductorySetter";
  }
  String introductoryMethod() => "introductoryMethod";

  void testAugmenting() {
    Expect.equals("augmentingStatic", E.augmentingStatic);
    Expect.equals("augmentingStaticGetter", E.augmentingStaticGetter);
    E.augmentingStaticSetter = "";
    Expect.equals("augmentingStaticSetter", _log);
    Expect.equals("augmentingStaticMethod", E.augmentingStaticMethod());

    Expect.equals("augmentingInstance", this.augmentingInstance);
    Expect.equals("augmentingGetter", this.augmentingGetter);
    this.augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", this.augmentingMethod());
  }
}

class A {}

extension Ext on A {
  static const introductoryStatic = "introductoryStatic";
  static String get introductoryStaticGetter => "introductoryStaticGetter";
  static void set introductoryStaticSetter(String _) {
    _log = "introductoryStaticSetter";
  }
  static String introductoryStaticMethod() => "introductoryStaticMethod";

  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {
    _log = "introductorySetter";
  }
  String introductoryMethod() => "introductoryMethod";

  void testAugmenting() {
    Expect.equals("augmentingStatic", Ext.augmentingStatic);
    Expect.equals("augmentingStaticGetter", Ext.augmentingStaticGetter);
    Ext.augmentingStaticSetter = "";
    Expect.equals("augmentingStaticSetter", _log);
    Expect.equals("augmentingStaticMethod", Ext.augmentingStaticMethod());

    Expect.equals("augmentingGetter", this.augmentingGetter);
    this.augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", this.augmentingMethod());
  }
}

extension type ET(String id) {
  static const introductoryStatic = "introductoryStatic";
  static String get introductoryStaticGetter => "introductoryStaticGetter";
  static void set introductoryStaticSetter(String _) {
    _log = "introductoryStaticSetter";
  }
  static String introductoryStaticMethod() => "introductoryStaticMethod";

  String get introductoryGetter => "introductoryGetter";
  void set introductorySetter(String _) {
    _log = "introductorySetter";
  }
  String introductoryMethod() => "introductoryMethod";

  void testAugmenting() {
    Expect.equals("augmentingStatic", ET.augmentingStatic);
    Expect.equals("augmentingStaticGetter", ET.augmentingStaticGetter);
    ET.augmentingStaticSetter = "";
    Expect.equals("augmentingStaticSetter", _log);
    Expect.equals("augmentingStaticMethod", ET.augmentingStaticMethod());

    Expect.equals("augmentingGetter", this.augmentingGetter);
    this.augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", this.augmentingMethod());
  }
}

class MA = Object with M;

main() {
  C().testAugmenting();
  C().testIntroductory();
  MA().testAugmenting();
  MA().testIntroductory();
  E.e0.testAugmenting();
  E.e0.testIntroductory();
  A().testAugmenting();
  A().testIntroductory();
  ET("id").testAugmenting();
  ET("id").testIntroductory();
}
