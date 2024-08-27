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

augment library 'scoping_A01_t02.dart';
import '../../Utils/expect.dart';

const augmentingStatic = "Global augmentingStatic";
String get augmentingStaticGetter => "Global augmentingStaticGetter";
void set augmentingStaticSetter(String _) {
  _log = "Global augmentingStaticSetter";
}
String augmentingStaticMethod() => "Global augmentingStaticMethod";

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
    Expect.equals("Global introductoryStatic", introductoryStatic);
    Expect.equals("Global introductoryStaticGetter", introductoryStaticGetter);
    introductoryStaticSetter = "";
    Expect.equals("introductoryStaticSetter", _log);
    Expect.equals("Global introductoryStaticMethod", introductoryStaticMethod());

    Expect.equals("introductoryInstance", introductoryInstance);
    Expect.equals("introductoryGetter", introductoryGetter);
    introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", introductoryMethod());
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
    Expect.equals("Global introductoryStatic", introductoryStatic);
    Expect.equals("Global introductoryStaticGetter", introductoryStaticGetter);
    introductoryStaticSetter = "";
    Expect.equals("Global introductoryStaticSetter", _log);
    Expect.equals("Global introductoryStaticMethod", introductoryStaticMethod());

    Expect.equals("introductoryInstance", introductoryInstance);
    Expect.equals("introductoryGetter", introductoryGetter);
    introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", introductoryMethod());
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
    Expect.equals("Global introductoryStatic", introductoryStatic);
    Expect.equals("Global introductoryStaticGetter", introductoryStaticGetter);
    introductoryStaticSetter = "";
    Expect.equals("Global introductoryStaticSetter", _log);
    Expect.equals("Global introductoryStaticMethod", introductoryStaticMethod());

    Expect.equals("introductoryInstance", introductoryInstance);
    Expect.equals("introductoryGetter", introductoryGetter);
    introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", introductoryMethod());
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
    Expect.equals("Global introductoryStatic", introductoryStatic);
    Expect.equals("Global introductoryStaticGetter", introductoryStaticGetter);
    introductoryStaticSetter = "";
    Expect.equals("Global introductoryStaticSetter", _log);
    Expect.equals("Global introductoryStaticMethod", introductoryStaticMethod());

    Expect.equals("introductoryGetter", introductoryGetter);
    introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", introductoryMethod());
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
    Expect.equals("Global introductoryStatic", introductoryStatic);
    Expect.equals("Global introductoryStaticGetter", introductoryStaticGetter);
    ET.introductoryStaticSetter = "";
    Expect.equals("Global introductoryStaticSetter", _log);
    Expect.equals("Global introductoryStaticMethod", introductoryStaticMethod());

    Expect.equals("introductoryGetter", introductoryGetter);
    introductorySetter = "";
    Expect.equals("introductorySetter", _log);
    Expect.equals("introductoryMethod", introductoryMethod());

    Expect.equals("id", id);
  }
}
