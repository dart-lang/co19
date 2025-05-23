// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations aren't allowed to replace code, so they mostly add
/// entirely new declarations to the surrounding type. However, function and
/// constructor augmentations can fill in a body for an augmented declaration
/// that is lacks one.
///
/// @description Checks that it is still a compile-time error if a body of an
/// abstract member of a non-abstract class is not provided by an augmentation.
/// Test static members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_declarations_A05_t04_lib.dart';

class C {
  static String abstractMethod();
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  static String get abstractGetter;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  static void set abstractSetter(String v);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static String abstractMethod();
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  static String get abstractGetter;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  static void set abstractSetter(String v);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static String abstractMethod();
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  static String get abstractGetter;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  static void set abstractSetter(String v);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static String abstractMethod();
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  static String get abstractGetter;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  static void set abstractSetter(String v);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(String _) {
  static String abstractMethod();
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  static String get abstractGetter;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  static void set abstractSetter(String v);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
