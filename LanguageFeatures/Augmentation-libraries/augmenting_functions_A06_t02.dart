// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmenting declaration uses `augmented` when the augmented declaration
///   has no concrete implementation. Note that all external declarations are
///   assumed to have an implementation provided by another external source, and
///   they will throw a runtime exception when called if not.
///
/// @description Checks that it is not an error if an augmenting
/// declaration uses `augmented` when the original declaration is an `external`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A06_t02_lib.dart';

external void topLevelFunction();

class C {
  external static void staticMethod();
  external void instanceMethod();
}

mixin M {
  external static void staticMethod();
  external void instanceMethod();
}

enum E {
  e1;
  external static void staticMethod();
  external void instanceMethod();
}

class A {}

extension Ext on A {
  external static void staticMethod();
  external void instanceMethod();
}

extension type ET(int _) {
  external static void staticMethod();
  external void instanceMethod();
}

class MA = Object with M;

main() {
  Expect.throws(() {
    topLevelFunction();
  });
  Expect.throws(() {
    C.staticMethod();
  });
  Expect.throws(() {
    C().instanceMethod();
  });
  Expect.throws(() {
    M.staticMethod();
  });
  Expect.throws(() {
    MA().instanceMethod();
  });
  Expect.throws(() {
    E.staticMethod();
  });
  Expect.throws(() {
    E.e1.instanceMethod();
  });
  Expect.throws(() {
    Ext.staticMethod();
  });
  Expect.throws(() {
    A().instanceMethod();
  });
  Expect.throws(() {
    ET.staticMethod();
  });
  Expect.throws(() {
    ET(0).instanceMethod();
  });
}
