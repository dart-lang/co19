// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration `D` is a declaration marked with the
/// built-in identifier `augment`. We add `augment` as a built-in identifier as
/// a language versioned change, to avoid breaking pre-feature code.
///
/// `D` augments a declaration `I` with the same name and in the same
/// augmentation context as `D`. There may be multiple augmentations in the
/// augmentation context of `D`. More precisely, `I` is the declaration before
/// `D` and after every other declaration before `D`.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears before the introductory one. Test augmenting declaration
/// in a main library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of  'augmenting_declarations_A02_t04.dart';

augment abstract class C {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  abstract int instanceVariable;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment mixin M {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment enum E {
  e1;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment extension Etx {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment extension type ET {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}
