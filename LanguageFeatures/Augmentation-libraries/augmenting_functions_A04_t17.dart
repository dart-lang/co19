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
/// @description Checks that it is a compile-time error if a `covariant`
/// modifier of parameters of an augmentation doesn't exactly match the original
/// function
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A04_t17_lib.dart';

class C {
  void instanceMethod1(num i) {}
  void instanceMethod2([num i = 1]) {}
  void instanceMethod3({num i = 1}) {}
  void instanceMethod4({required num i}) {}
}

mixin M {
  void instanceMethod1(num i) {}
  void instanceMethod2([num i = 1]) {}
  void instanceMethod3({num i = 1}) {}
  void instanceMethod4({required num i}) {}
}

enum E {
  e1;

  void instanceMethod1(num i) {}
  void instanceMethod2([num i = 1]) {}
  void instanceMethod3({num i = 1}) {}
  void instanceMethod4({required num i}) {}
}

main() {
  print(C);
  print(M);
  print(E);
}
