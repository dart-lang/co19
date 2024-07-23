// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The function signature of the augmenting function does not exactly match
///   the function signature of the augmented function. This means that any
///   provided return types must be the same type; there must be same number or
///   required and optional positional parameters, all with the same types (when
///   provided), the same number of named parameters, each pairwise with the
///   same name, same type (when provided) and same `required` and `covariant`
///   modifiers, and any type parameters and their bounds (when provided) must
///   be the same (like for type declarations).
///
/// @description Checks that it is not an error if type parameters of an
/// augmentation exactly matches the original function.
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

extension type ET(int _) {
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

  ET.staticMethod<String, double>();
  Expect.equals("String, double", _log);
  ET(0).instanceMethod<String, int>();
  Expect.equals("String, int", _log);
}
