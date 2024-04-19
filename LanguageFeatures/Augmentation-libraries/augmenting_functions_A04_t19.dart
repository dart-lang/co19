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
/// @description Checks that it is not an error if type parameters of an
/// augmentation exactly matches the original function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A04_t19_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void topLevelFunction<X, Y extends num>() {}

class C {
  static void staticMethod<X, Y extends num>() {}
  void instanceMethod<X, Y extends num>() {}
}

mixin M {
  static void staticMethod<X, Y extends num>() {}
  void instanceMethod<X, Y extends num>() {}
}

enum E {
  e1;

  static void staticMethod<X, Y extends num>() {}
  void instanceMethod<X, Y extends num>() {}
}

class A {}

extension Ext on A {
  static void staticMethod<X, Y extends num>() {}
  void instanceMethod<X, Y extends num>() {}
}

class MA = Object with M;

main() {
  topLevelFunction<String, int>();
  Expect.equals("String, int", _log);

  C.staticMethod<String, double>();
  Expect.equals("String, double", _log);
  C().instanceMethod<String, int>();
  Expect.equals("String, int", _log);

  M.staticMethod<String, double>();
  Expect.equals("String, double", _log);
  MA().instanceMethod<String, int>();
  Expect.equals("String, int", _log);

  E.staticMethod<String, double>();
  Expect.equals("String, double", _log);
  E.e1.instanceMethod<String, int>();
  Expect.equals("String, int", _log);

  Ext.staticMethod<String, double>();
  Expect.equals("String, double", _log);
  A().instanceMethod<String, int>();
  Expect.equals("String, int", _log);
}
