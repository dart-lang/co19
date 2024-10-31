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
/// the implicit augmented setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A02_t02.dart';
import '../../Utils/expect.dart';

augment void set topLevelVariable(String value) {
  augmented = "a";
  Expect.equals("a", topLevelVariable);
  _log = "Augmented: $value";
}

augment class C {
  augment static void set staticVariable(String value) {
    augmented = "b";
    Expect.equals("b", staticVariable);
    _log = "Augmented: $value";
  }
  augment void set instanceVariable(String value) {
    augmented = "c";
    Expect.equals("c", instanceVariable);
    _log = "Augmented: $value";
  }
}

augment mixin M {
  augment static void set staticVariable(String value) {
    augmented = "d";
    Expect.equals("d", staticVariable);
    _log = "Augmented: $value";
  }
  augment void set instanceVariable(String value) {
    augmented = "e";
    Expect.equals("e", instanceVariable);
    _log = "Augmented: $value";
  }
}

augment enum E {
  augment e1;

  augment static void set staticVariable(String value) {
    augmented = "f";
    Expect.equals("f", staticVariable);
    _log = "Augmented: $value";
  }
}

augment extension Ext {
  augment static void set staticVariable(String value) {
    augmented = "g";
    Expect.equals("g", staticVariable);
    _log = "Augmented: $value";
  }
}

augment extension type ET {
  augment static void set staticVariable(String value) {
    augmented = "h";
    Expect.equals("h", staticVariable);
    _log = "Augmented: $value";
  }
}
