// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` must be
///   followed by the operator. For example when augmenting `+` you must do
///   `augmented + 1`, and when augmenting `[]` you must do `augmented[<arg>]`.
///   These constructs invoke the augmented operator, and are the only valid
///   uses of `augmented` in these contexts.
///
/// @description Checks that within an augmenting operator `augmented` invokes
/// the augmented one and evaluates it to the return value. Test a local
/// function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t21.dart';
import '../../Utils/expect.dart';

augment class C {
  void operator []=(int index, Object? value) {
    void local() {
      augmented[index] = value;
      Expect.equals("Original [$index]=$value", _log);
    }
    local();
    _log = "Augmented [$index]=$value";
  }
}

augment mixin M {
  void operator []=(int index, Object? value) {
    void local() {
      augmented[index] = value;
      Expect.equals("Original [$index]=$value", _log);
    }
    local();
    _log = "Augmented [$index]=$value";
  }
}

augment enum E {
  augment e1;
  void operator []=(int index, Object? value) {
    void local() {
      augmented[index] = value;
      Expect.equals("Original [$index]=$value", _log);
    }
    local();
    _log = "Augmented [$index]=$value";
  }
}

augment extension Ext {
  void operator []=(int index, Object? value) {
    void local() {
      augmented[index] = value;
      Expect.equals("Original [$index]=$value", _log);
    }
    local();
    _log = "Augmented [$index]=$value";
  }
}
