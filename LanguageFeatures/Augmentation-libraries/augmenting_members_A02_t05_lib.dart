// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-writable variable declaration is augmented with a setter.
///
/// @description Checks that it is not an error to augment a `late final`
/// variable declaration with no initializer with a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A02_t05.dart';

augment void set topLevelVariable(String v) {
  _log = "Augmented: $v";
}

augment class C {
  augment static void set staticVariable(String v) {
    _log = "Augmented: $v";
  }

  augment void set instanceVariable(String v) {
    _log = "Augmented: $v";
  }
}

augment mixin M {
  augment static void set staticVariable(String v) {
    _log = "Augmented: $v";
  }

  augment void set instanceVariable(String v) {
    _log = "Augmented: $v";
  }
}

augment enum E {
  augment e0;
  augment static void set staticVariable(String v) {
    _log = "Augmented: $v";
  }
}

augment extension Ext {
  augment static void set staticVariable(String v) {
    _log = "Augmented: $v";
  }
}

augment extension type ET {
  augment static void set staticVariable(String v) {
    _log = "Augmented: $v";
  }
}
