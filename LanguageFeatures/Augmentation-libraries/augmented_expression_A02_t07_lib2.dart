// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a field with a setter, this will invoke the implicit setter
///   from the augmented field.
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
  Expect.equals("Augmented1: a", _log);
  _log = "Augmented2: $value";
}

augment class C {
  augment static void set staticSetter(String value) {
    augmented = "b";
    Expect.equals("Augmented1: b", _log);
    _log = "Augmented2: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "c";
    Expect.equals("Augmented1: c", _log);
    _log = "Augmented2: $value";
  }
}

augment mixin M {
  augment static void set staticSetter(String value) {
    augmented = "d";
    Expect.equals("Augmented1: d", _log);
    _log = "Augmented2: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "e";
    Expect.equals("Augmented1: e", _log);
    _log = "Augmented2: $value";
  }
}

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
    augmented = "f";
    Expect.equals("Augmented1: f", _log);
    _log = "Augmented2: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "g";
    Expect.equals("Augmented1: g", _log);
    _log = "Augmented2: $value";
  }
}

augment extension Ext {
  augment static void set staticSetter(String value) {
    augmented = "h";
    Expect.equals("Augmented1: h", _log);
    _log = "Augmented2: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "g";
    Expect.equals("Augmented1: g", _log);
    _log = "Augmented2: $value";
  }
}
