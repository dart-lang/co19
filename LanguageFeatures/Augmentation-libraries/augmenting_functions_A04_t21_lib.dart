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
/// @description Checks that it is not an error if a `covariant` modifier of
/// parameters of an augmentation exactly matches the original function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t21.dart';

augment class C {
  augment void instanceMethod1(covariant num i) {
    _log = "i=$i";
  }
  augment void instanceMethod2([covariant num i = 1]) {
    _log = "i=$i";
  }
  augment void instanceMethod3({covariant num i = 1}) {
    _log = "i=$i";
  }
  augment void instanceMethod4({required covariant num i}) {
    _log = "i=$i";
  }
  augment void instanceMethod5<T>({required covariant T i}) {
    _log = "i=$i";
  }
}

augment mixin M {
  augment void instanceMethod1(covariant num i) {
    _log = "i=$i";
  }
  augment void instanceMethod2([covariant num i = 1]) {
    _log = "i=$i";
  }
  augment void instanceMethod3({covariant num i = 1}) {
    _log = "i=$i";
  }
  augment void instanceMethod4({required covariant num i}) {
    _log = "i=$i";
  }
  augment void instanceMethod5<T>({required covariant T i}) {
    _log = "i=$i";
  }
}

augment enum E {
  augment e1;

  augment void instanceMethod1(covariant num i) {
    _log = "i=$i";
  }
  augment void instanceMethod2([covariant num i = 1]) {
    _log = "i=$i";
  }
  augment void instanceMethod3({covariant num i = 1}) {
    _log = "i=$i";
  }
  augment void instanceMethod4({required covariant num i}) {
    _log = "i=$i";
  }
  augment void instanceMethod5<T>({required covariant T i}) {
    _log = "i=$i";
  }
}
