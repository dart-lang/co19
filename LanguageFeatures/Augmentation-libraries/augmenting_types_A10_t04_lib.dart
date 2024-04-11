// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that static members defined in the body of an augment
/// of a class, mixin, extension, or enum are added to a static namespace of
/// the corresponding type in the augmented library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A10_t04.dart';

augment class C {
  static String method() => "C";
  static String get getter => "get C";
  static void set setter(String v) {}
}

augment mixin M {
  static String method() => "M";
  static String get getter => "get M";
  static void set setter(String v) {}
}

augment enum E {
  augment e1;
  static String method() => "E";
  static String get getter => "get E";
  static void set setter(String v) {}
}

augment extension ExtA {
  static String method() => "ExtA";
  static String get getter => "get ExtA";
  static void set setter(String v) {}
}
