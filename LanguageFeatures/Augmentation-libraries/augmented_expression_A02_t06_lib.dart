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
/// the augmented setter but within an augmented setter `augmented=` can be used
/// to invoke appropriate setter if there is one in the scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A02_t06.dart';
import '../../Utils/expect.dart';

augment void set topLevelSetter(String value) {
  augmented = "a";
  Expect.equals("Setter augmented: a, via original declaration", _log);
  _log = "Augmented: $value";
}

augment class C {
  augment static void set staticSetter(String value) {
    augmented = "b";
    Expect.equals("Setter augmented: b, via original declaration", _log);
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "c";
    Expect.equals("Setter augmented: c, via original declaration", _log);
    _log = "Augmented: $value";
  }
}

augment mixin M {
  augment static void set staticSetter(String value) {
    augmented = "d";
    Expect.equals("Setter augmented: d, via original declaration", _log);
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "e";
    Expect.equals("Setter augmented: e, via original declaration", _log);
    _log = "Augmented: $value";
  }
}

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
    augmented = "f";
    Expect.equals("Setter augmented: f, via original declaration", _log);
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "g";
    Expect.equals("Setter augmented: g, via original declaration", _log);
    _log = "Augmented: $value";
  }
}

augment extension Ext {
  augment static void set staticSetter(String value) {
    augmented = "h";
    Expect.equals("Setter augmented: h, via original declaration", _log);
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    augmented = "g";
    Expect.equals("Setter augmented: g, via original declaration", _log);
    _log = "Augmented: $value";
  }
}
