// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations aren't allowed to replace code, so they mostly add
/// entirely new declarations to the surrounding type. However, function and
/// constructor augmentations can fill in a body for an augmented declaration
/// that is lacks one.
///
/// @description Checks that it is not an error if a body of an abstract static
/// member is provided by an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of  'augmenting_declarations_A05_t02.dart';

String _log = "";

augment class C {
  augment static String abstractMethod() => "abstractMethod";
  augment static String get abstractGetter => "abstractGetter";
  augment static void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment mixin M {
  augment static String abstractMethod() => "abstractMethod";
  augment static String get abstractGetter => "abstractGetter";
  augment static void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment enum E {
  augment e0;
  augment static String abstractMethod() => "abstractMethod";
  augment static String get abstractGetter => "abstractGetter";
  augment static void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment extension Ext {
  augment static String abstractMethod() => "abstractMethod";
  augment static String get abstractGetter => "abstractGetter";
  augment static void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment extension type ET {
  augment static String abstractMethod() => "abstractMethod";
  augment static String get abstractGetter => "abstractGetter";
  augment static void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}
