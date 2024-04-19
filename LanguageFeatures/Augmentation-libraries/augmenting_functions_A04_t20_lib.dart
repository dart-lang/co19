// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the function augmentation does not exactly match the
///   original function. This means the return types must be the same; there
///   must be the same number of positional, optional, and named parameters; the
///   types of corresponding positional and optional parameters must be the
///   same; the names and types of named parameters must be the same; any type
///   parameters and bounds must be the same; and any required or covariant
///   modifiers must match.
///
/// @description Checks that it is not an error if a `required` modifier of
/// named parameters of an augmentation exactly matches the original function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t20.dart';

augment void topLevelFunction({required int i}) {
  _log = "i=$i";
}

augment class C {
  augment static void staticMethod({required int i}) {
    _log = "i=$i";
  }
  augment void instanceMethod({required int i}) {
    _log = "i=$i";
  }
}

augment mixin M {
  augment static void staticMethod({required int i}) {
  _log = "i=$i";
  }
  augment void instanceMethod({required int i}) {
  _log = "i=$i";
  }
}

augment enum E {
  augment e1;

  augment static void staticMethod({required int i}) {
    _log = "i=$i";
  }
  augment void instanceMethod({required int i}) {
    _log = "i=$i";
  }
}

augment extension Ext {
  augment static void staticMethod({required int i}) {
    _log = "i=$i";
  }
  augment void instanceMethod({required int i}) {
    _log = "i=$i";
  }
}
