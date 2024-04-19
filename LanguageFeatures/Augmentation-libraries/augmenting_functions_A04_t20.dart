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

import augment 'augmenting_functions_A04_t20_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void topLevelFunction({required int i}) {}

class C {
  static void staticMethod({required int i}) {}
  void instanceMethod({required int i}) {}
}

mixin M {
  static void staticMethod({required int i}) {}
  void instanceMethod({required int i}) {}
}

enum E {
  e1;

  static void staticMethod({required int i}) {}
  void instanceMethod({required int i}) {}
}

class A {}

extension Ext on A {
  static void staticMethod({required int i}) {}
  void instanceMethod({required int i}) {}
}

class MA = Object with M;

main() {
  topLevelFunction(i: 1);
  Expect.equals("i=1", _log);

  C.staticMethod(i: 2);
  Expect.equals("i=2", _log);
  C().instanceMethod(i: 3);
  Expect.equals("i=3", _log);

  M.staticMethod(i: 4);
  Expect.equals("i=4", _log);
  MA().instanceMethod(i: 5);
  Expect.equals("i=5", _log);

  E.staticMethod(i: 6);
  Expect.equals("i=6", _log);
  E.e1.instanceMethod(i: 7);
  Expect.equals("i=7", _log);

  Ext.staticMethod(i: 8);
  Expect.equals("i=8", _log);
  A().instanceMethod(i: 9);
  Expect.equals("i=9", _log);
}
