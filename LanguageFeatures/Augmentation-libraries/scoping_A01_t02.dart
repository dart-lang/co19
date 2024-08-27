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
/// @description Checks that `name` is interpreted as `this.name` if it occurs
/// inside a scope where a `this` is available.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'scoping_A01_t02_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

const introductoryStatic = "Global introductoryStatic";
String get introductoryStaticGetter => "Global introductoryStaticGetter";
void set introductoryStaticSetter(String _) {
  _log = "Global introductoryStaticSetter";
}
String introductoryStaticMethod() => "Global introductoryStaticSetter";

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
    Expect.equals("Global augmentingStatic", augmentingStatic);
    Expect.equals("Global augmentingStaticGetter", augmentingStaticGetter);
    augmentingStaticSetter = "";
    Expect.equals("Global augmentingStaticSetter", _log);
    Expect.equals("Global augmentingStaticMethod", augmentingStaticMethod());

    Expect.equals("augmentingInstance", augmentingInstance);
    Expect.equals("augmentingGetter", augmentingGetter);
    augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", augmentingMethod());
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
    Expect.equals("Global augmentingStatic", augmentingStatic);
    Expect.equals("Global augmentingStaticGetter", augmentingStaticGetter);
    augmentingStaticSetter = "";
    Expect.equals("Global augmentingStaticSetter", _log);
    Expect.equals("Global augmentingStaticMethod", augmentingStaticMethod());

    Expect.equals("augmentingInstance", augmentingInstance);
    Expect.equals("augmentingGetter", augmentingGetter);
    augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", augmentingMethod());
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
    Expect.equals("Global augmentingStatic", augmentingStatic);
    Expect.equals("Global augmentingStaticGetter", augmentingStaticGetter);
    augmentingStaticSetter = "";
    Expect.equals("Global augmentingStaticSetter", _log);
    Expect.equals("Global augmentingStaticMethod", augmentingStaticMethod());

    Expect.equals("augmentingInstance", augmentingInstance);
    Expect.equals("augmentingGetter", augmentingGetter);
    augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", augmentingMethod());
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
    Expect.equals("Global augmentingStatic", augmentingStatic);
    Expect.equals("Global augmentingStaticGetter", augmentingStaticGetter);
    augmentingStaticSetter = "";
    Expect.equals("Global augmentingStaticSetter", _log);
    Expect.equals("Global augmentingStaticMethod", augmentingStaticMethod());

    Expect.equals("augmentingGetter", augmentingGetter);
    augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", augmentingMethod());
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
    Expect.equals("Global augmentingStatic", augmentingStatic);
    Expect.equals("Global augmentingStaticGetter", augmentingStaticGetter);
    augmentingStaticSetter = "";
    Expect.equals("Global augmentingStaticSetter", _log);
    Expect.equals("Global augmentingStaticMethod", augmentingStaticMethod());

    Expect.equals("augmentingGetter", augmentingGetter);
    augmentingSetter = "";
    Expect.equals("augmentingSetter", _log);
    Expect.equals("augmentingMethod", augmentingMethod());
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
