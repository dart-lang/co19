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

import augment 'augmenting_functions_A04_t21_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

class C {
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
  void instanceMethod5<T>({required covariant T i}) {}
}

mixin M {
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
  void instanceMethod5<T>({required covariant T i}) {}
}

enum E {
  e1;

  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
  void instanceMethod5<T>({required covariant T i}) {}
}

class MA = Object with M;

main() {
  C().instanceMethod1(1);
  Expect.equals("i=1", _log);
  C().instanceMethod2(2);
  Expect.equals("i=2", _log);
  C().instanceMethod3(i: 3);
  Expect.equals("i=3", _log);
  C().instanceMethod4(i: 4);
  Expect.equals("i=4", _log);
  C().instanceMethod5<int>(i: 5);
  Expect.equals("i=5", _log);

  MA().instanceMethod1(1);
  Expect.equals("i=1", _log);
  MA().instanceMethod2(2);
  Expect.equals("i=2", _log);
  MA().instanceMethod3(i: 3);
  Expect.equals("i=3", _log);
  MA().instanceMethod4(i: 4);
  Expect.equals("i=4", _log);
  MA().instanceMethod5<int>(i: 5);
  Expect.equals("i=5", _log);

  E.e1.instanceMethod1(1);
  Expect.equals("i=1", _log);
  E.e1.instanceMethod2(2);
  Expect.equals("i=2", _log);
  E.e1.instanceMethod3(i: 3);
  Expect.equals("i=3", _log);
  E.e1.instanceMethod4(i: 4);
  Expect.equals("i=4", _log);
  E.e1.instanceMethod5<int>(i: 5);
  Expect.equals("i=5", _log);
}
