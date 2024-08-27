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

augment library 'scoping_A01_t01.dart';
import '../../Utils/expect.dart';

const augmentingStatic = "Should not be used!";
String get augmentingStaticGetter => "Should not be used!";
void set augmentingStaticSetter(String _) {
  _log = "Should not be used!";
}
String augmentingStaticMethod() => "Should not be used!";

String augmentingInstance = "Should not be used!";
String get augmentingGetter => "Should not be used!";
void set augmentingSetter(String _) {
  _log = "Should not be used!";
}
String augmentingMethod() => "Should not be used!";

augment class C {
  static const augmentingStatic = "augmentingStatic";
  static String get augmentingStaticGetter => "augmentingStaticGetter";
  static void set augmentingStaticSetter(String _) {
    _log = "augmentingStaticSetter";
  }
  static String augmentingStaticMethod() => "augmentingStaticMethod";

  String augmentingInstance = "augmentingInstance";
  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {
    _log = "augmentingSetter";
  }
  String augmentingMethod() => "augmentingMethod";

  void testIntroductory() {
    Expect.equals("introductoryStatic", C.introductoryStatic);
    Expect.equals("introductoryStaticGetter", C.introductoryStaticGetter);
    C.introductoryStaticSetter = "";
    Expect.equals("introductoryStaticSetter", _log);
    Expect.equals("introductoryStaticMethod", C.introductoryStaticMethod());

    Expect.equals("introductoryInstance", this.introductoryInstance);
    Expect.equals("introductoryGetter", this.introductoryGetter);
    this.introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", this.introductoryMethod());
  }
}

augment mixin M {
  static const augmentingStatic = "augmentingStatic";
  static String get augmentingStaticGetter => "augmentingStaticGetter";
  static void set augmentingStaticSetter(String _) {
    _log = "augmentingStaticSetter";
  }
  static String augmentingStaticMethod() => "augmentingStaticMethod";

  String augmentingInstance = "augmentingInstance";
  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {
    _log = "augmentingSetter";
  }
  String augmentingMethod() => "augmentingMethod";

  void testIntroductory() {
    Expect.equals("introductoryStatic", M.introductoryStatic);
    Expect.equals("introductoryStaticGetter", M.introductoryStaticGetter);
    M.introductoryStaticSetter = "";
    Expect.equals("introductoryStaticSetter", _log);
    Expect.equals("introductoryStaticMethod", M.introductoryStaticMethod());

    Expect.equals("introductoryInstance", this.introductoryInstance);
    Expect.equals("introductoryGetter", this.introductoryGetter);
    this.introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", this.introductoryMethod());
  }
}

augment enum E {
  augment e0;
  static const augmentingStatic = "augmentingStatic";
  static String get augmentingStaticGetter => "augmentingStaticGetter";
  static void set augmentingStaticSetter(String _) {
    _log = "augmentingStaticSetter";
  }
  static String augmentingStaticMethod() => "augmentingStaticMethod";

  final String augmentingInstance = "augmentingInstance";
  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {
    _log = "augmentingSetter";
  }
  String augmentingMethod() => "augmentingMethod";

  void testIntroductory() {
    Expect.equals("introductoryStatic", E.introductoryStatic);
    Expect.equals("introductoryStaticGetter", E.introductoryStaticGetter);
    E.introductoryStaticSetter = "";
    Expect.equals("introductoryStaticSetter", _log);
    Expect.equals("introductoryStaticMethod", E.introductoryStaticMethod());

    Expect.equals("introductoryInstance", this.introductoryInstance);
    Expect.equals("introductoryGetter", this.introductoryGetter);
    this.introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", this.introductoryMethod());
  }
}

augment extension Ext {
  static const augmentingStatic = "augmentingStatic";
  static String get augmentingStaticGetter => "augmentingStaticGetter";
  static void set augmentingStaticSetter(String _) {
    _log = "augmentingStaticSetter";
  }
  static String augmentingStaticMethod() => "augmentingStaticMethod";

  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {
    _log = "augmentingSetter";
  }
  String augmentingMethod() => "augmentingMethod";

  void testIntroductory() {
    Expect.equals("introductoryStatic", Ext.introductoryStatic);
    Expect.equals("introductoryStaticGetter", Ext.introductoryStaticGetter);
    Ext.introductoryStaticSetter = "";
    Expect.equals("introductoryStaticSetter", _log);
    Expect.equals("introductoryStaticMethod", Ext.introductoryStaticMethod());

    Expect.equals("introductoryGetter", this.introductoryGetter);
    this.introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", this.introductoryMethod());
  }
}

augment extension type ET {
  static const augmentingStatic = "augmentingStatic";
  static String get augmentingStaticGetter => "augmentingStaticGetter";
  static void set augmentingStaticSetter(String _) {
    _log = "augmentingStaticSetter";
  }
  static String augmentingStaticMethod() => "augmentingStaticMethod";

  String get augmentingGetter => "augmentingGetter";
  void set augmentingSetter(String _) {
    _log = "augmentingSetter";
  }
  String augmentingMethod() => "augmentingMethod";

  void testIntroductory() {
    Expect.equals("introductoryStatic", ET.introductoryStatic);
    Expect.equals("introductoryStaticGetter", ET.introductoryStaticGetter);
    ET.introductoryStaticSetter = "";
    Expect.equals("introductoryStaticSetter", _log);
    Expect.equals("introductoryStaticMethod", ET.introductoryStaticMethod());

    Expect.equals("introductoryGetter", this.introductoryGetter);
    this.introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", this.introductoryMethod());

    Expect.equals("id", this.id);
  }
}
