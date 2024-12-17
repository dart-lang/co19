// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   augmented getter and evaluates to its return value. If augmenting a
///   variable with a getter, this will invoke the implicitly induced getter
///   from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error if an augmenting getter
/// has a metadata named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {
  const augmented();
}

@augmented()
String get topLevelGetter => "Original";

@augmented()
augment String get topLevelGetter;

class C {
  @augmented()
  static String get staticGetter1 => "Original";
  @augmented()
  String get instanceGetter1 => "Original";
}

augment class C {
  @augmented() augment static String get staticGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static String get staticGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment String get instanceGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String get instanceGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  @augmented()
  static String get staticGetter1 => "Original";
  @augmented()
  String get instanceGetter1 => "Original";
}

augment mixin M {
  @augmented() augment static String get staticGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static String get staticGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment String get instanceGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String get instanceGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  @augmented()
  static String get staticGetter1 => "Original";
  @augmented()
  String get instanceGetter1 => "Original";
}

augment enum E {
  e1;

  @augmented() augment static String get staticGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static String get staticGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment String get instanceGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String get instanceGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  @augmented()
  static String get staticGetter1 => "Original";
  @augmented()
  String get instanceGetter1 => "Original";
}

augment extension Ext {
  @augmented() augment static String get staticGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static String get staticGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment String get instanceGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String get instanceGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  @augmented()
  static String get staticGetter1 => "Original";
  @augmented()
  String get instanceGetter1 => "Original";
}

augment extension type ET {
  @augmented() augment static String get staticGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static String get staticGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment String get instanceGetter1;
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() String get instanceGetter2 => "Augmented";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelGetter;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
