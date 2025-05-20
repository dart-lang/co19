// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is already a compile-time error for multiple declarations to
/// have the same name in the same scope. This error is checked after part files
/// and augmentations have been applied. In other words, it's an error to
/// declare the same top-level name in a library and a part, the same top-level
/// name in two parts, the same static or instance name inside an introductory
/// declaration and an augmentation on that declaration, or the same static or
/// instance name inside two augmentations of the same declaration.
///
/// @description Checks that members of a declaration are resolved after all
/// part files and augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'scoping_A02_t03.dart';

augment class C {
  static String get name1 => "Static member";
  String get name2 => "Instance member";
}

augment mixin M {
  static String get name1 => "Static member";
  String get name2 => "Instance member";
}

augment enum E {
  augment e0;
  static String get name1 => "Static member";
  String get name2 => "Instance member";
}

augment extension Ext {
  static String get name1 => "Static member";
  String get name2 => "Instance member";
}

augment extension type ET {
  static String get name1 => "Static member";
  String get name2 => "Instance member";
}
