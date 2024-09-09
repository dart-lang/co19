// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Because of augmentations, non-abstract class, mixin, mixin class,
/// enum, extension type, and extension declarations are now allowed to contain
/// abstract member declarations, as long as those members are equipped with a
/// body by an augmentation declaration.
///
/// @description Checks that it is not an error if a body of an abstract member
/// of a non-abstract class is provided by an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of  'augmenting_declarations_A05_t01.dart';

String _log = "";

augment class C {
  augment String abstractMethod() => "abstractMethod";
  augment String get abstractGetter => "abstractGetter";
  augment void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment mixin M {
  augment String abstractMethod() => "abstractMethod";
  augment String get abstractGetter => "abstractGetter";
  augment void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment enum E {
  augment e0;
  augment String abstractMethod() => "abstractMethod";
  augment String get abstractGetter => "abstractGetter";
  augment void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment extension Ext {
  augment String abstractMethod() => "abstractMethod";
  augment String get abstractGetter => "abstractGetter";
  augment void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}

augment extension type ET {
  augment String abstractMethod() => "abstractMethod";
  augment String get abstractGetter => "abstractGetter";
  augment void set abstractSetter(String v) {
    _log = "abstractSetter = $v";
  }
}
