// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration D is a declaration marked with the
/// new built-in identifier `augment`, which makes D augment a declaration D1
/// with the same name and in the same context as D. D1 is determined as being
/// before D and after every other declaration with the same name and in the
/// same context which is before D (that is, D1 is the greatest declaration
/// which is smaller than D, according to the 'after' ordering). A compile-time
/// error occurs if no declaration satisfies the requirements on D1.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears before non-augmenting one. Test augmented declaration in
/// a main library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library  'augmenting_declarations_A02_t04.dart';

augment class C {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment mixin M {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment enum E {
  augment e0;
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  final int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment extension Etx {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment extension type ET(int _) {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}
