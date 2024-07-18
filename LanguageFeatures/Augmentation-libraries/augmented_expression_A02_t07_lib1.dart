// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a variable with a setter, this will invoke the implicitly
///   induced setter from the augmented variable declaration.
///
/// @description Checks that within an augmenting setter `augmented=` invokes
/// the augmented setter. Test the case when a setter is augmented more than
/// once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A02_t07.dart';
import '../../Utils/expect.dart';

augment void set topLevelSetter(String value) {
  augmented = "a";
  Expect.equals("Original topLevelSetter: a", _log);
  _log = "Augmented1: $value";
}

augment class C {
  augment static void set staticSetter(String value) {
    augmented = "b";
    Expect.equals("Original C.staticSetter: b", _log);
    _log = "Augmented1: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "c";
    Expect.equals("Original C.instanceSetter: c", _log);
    _log = "Augmented1: $value";
  }
}

augment mixin M {
  augment static void set staticSetter(String value) {
    augmented = "d";
    Expect.equals("Original M.staticSetter: d", _log);
    _log = "Augmented1: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "e";
    Expect.equals("Original M.instanceSetter: e", _log);
    _log = "Augmented1: $value";
  }
}

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
    augmented = "f";
    Expect.equals("Original E.staticSetter: f", _log);
    _log = "Augmented1: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "g";
    Expect.equals("Original E.instanceSetter: g", _log);
    _log = "Augmented1: $value";
  }
}

augment extension Ext {
  augment static void set staticSetter(String value) {
    augmented = "h";
    Expect.equals("Original E.staticSetter: h", _log);
    _log = "Augmented1: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "g";
    Expect.equals("Original E.instanceSetter: g", _log);
    _log = "Augmented1: $value";
  }
}
