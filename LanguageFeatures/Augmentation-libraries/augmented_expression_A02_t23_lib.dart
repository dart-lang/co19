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
/// the augmented setter and binds the right hand side of the assignment
/// expression to the given actual argument. Test a function literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A02_t23.dart';
import '../../Utils/expect.dart';

augment void set topLevelSetter(String value) {
  var f = () {
    augmented = "a";
  };
  f();
  Expect.equals("topLevelSetter: a", _log);
}

augment class C {
  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "b";
    };
    f();
    Expect.equals("C.staticSetter: b", _log);
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "c";
    };
    f();
    Expect.equals("C.instanceSetter: c", _log);
  }
}

augment mixin M {
  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "d";
    };
    f();
    Expect.equals("M.staticSetter: d", _log);
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "e";
    };
    f();
    Expect.equals("M.instanceSetter: e", _log);
  }
}

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "f";
    };
    f();
    Expect.equals("E.staticSetter: f", _log);
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "g";
    };
    f();
    Expect.equals("E.instanceSetter: g", _log);
  }
}

augment extension Ext {
  augment static void set staticSetter(String value) {
    var f = () {
      augmented = "h";
    };
    f();
    Expect.equals("E.staticSetter: h", _log);
  }
  augment void set instanceSetter(String value) {
    var f = () {
      augmented = "i";
    };
    f();
    Expect.equals("E.instanceSetter: i", _log);
  }
}
