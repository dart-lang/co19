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
/// the augmented setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A02_t08.dart';
import '../../Utils/expect.dart';

augment void set topLevelSetter(String value) {
  var f = () {
    augmented = "a";
    return _log;
  };
  Expect.equals("topLevelSetter: a", f());
  _log = "Augmented: $value";
}

augment class C {
  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "b";
      return _log;
    };
    Expect.equals("C.staticSetter: b", f());
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "c";
      return _log;
    };
    Expect.equals("C.instanceSetter: c", f());
    _log = "Augmented: $value";
  }
}

augment mixin M {
  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "d";
      return _log;
    };
    Expect.equals("M.staticSetter: d", f());
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "e";
      return _log;
    };
    Expect.equals("M.instanceSetter: e", f());
    _log = "Augmented: $value";
  }
}

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "f";
      return _log;
    };
    Expect.equals("E.staticSetter: f", f());
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "g";
      return _log;
    };
    Expect.equals("E.instanceSetter: g", f());
    _log = "Augmented: $value";
  }
}

augment extension Ext {
  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "h";
      return _log;
    };
    Expect.equals("E.staticSetter: h", f());
    _log = "Augmented: $value";
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "i";
      return _log;
    };
    Expect.equals("E.instanceSetter: i", f());
    _log = "Augmented: $value";
  }
}
