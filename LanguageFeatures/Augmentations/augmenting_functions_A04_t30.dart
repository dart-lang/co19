// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional and optional parameters as the
///   augmented declaration.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For all corresponding pairs of parameters:
///   - They have the same type (if not omitted in the augmenting declaration).
///   - They have the same `required` and `covariant` modifiers.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a positional parameter whose
/// name is not `_` is accessed in the body even if there is an augmentation in
/// the chain that use wildcard as its name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int topLevelFunction1(int x) => x;
int topLevelFunction2([int _x = 2]) => _x;

augment int topLevelFunction1(int _);
augment int topLevelFunction2([int _]);

class C {
  static int staticMethod1(int _x) => _x;
  static int staticMethod2([int x = 2]) => x;
  int instanceMethod1(int x) => x;
  int instanceMethod2([int _x = 2]) => _x;
}

augment class C {
  augment static int staticMethod1(int _);
  augment static int staticMethod2([int _]);
  augment int instanceMethod1(int _);
  augment int instanceMethod2([int _]);
}

mixin M {
  static int staticMethod1(int _x) => _x;
  static int staticMethod2([int x = 2]) => x;
  int instanceMethod1(int x) => x;
  int instanceMethod2([int _x = 2]) => _x;
}

augment mixin M {
  augment static int staticMethod1(int _);
  augment static int staticMethod2([int _]);
  augment int instanceMethod1(int _);
  augment int instanceMethod2([int _]);
}

enum E {
  e1;
  static int staticMethod1(int _x) => _x;
  static int staticMethod2([int x = 2]) => x;
  int instanceMethod1(int x) => x;
  int instanceMethod2([int _x = 2]) => _x;
}

augment enum E {
  ;
  augment static int staticMethod1(int _);
  augment static int staticMethod2([int _]);
  augment int instanceMethod1(int _);
  augment int instanceMethod2([int _]);
}

class A {}

extension Ext on A {
  static int staticMethod1(int _x) => _x;
  static int staticMethod2([int x = 2]) => x;
  int instanceMethod1(int x) => x;
  int instanceMethod2([int _x = 2]) => _x;
}

augment extension Ext {
  augment static int staticMethod1(int _);
  augment static int staticMethod2([int _]);
  augment int instanceMethod1(int _);
  augment int instanceMethod2([int _]);
}

extension type ET(int _) {
  static int staticMethod1(int _x) => _x;
  static int staticMethod2([int x = 2]) => x;
  int instanceMethod1(int x) => x;
  int instanceMethod2([int _x = 2]) => _x;
}

augment extension type ET {
  augment static int staticMethod1(int _);
  augment static int staticMethod2([int _]);
  augment int instanceMethod1(int _);
  augment int instanceMethod2([int _]);
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelFunction1(1));
  Expect.equals(2, topLevelFunction2());

  Expect.equals(1, C.staticMethod1(1));
  Expect.equals(2, C.staticMethod2());
  Expect.equals(1, C().instanceMethod1(1));
  Expect.equals(2, C().instanceMethod2());

  Expect.equals(1, M.staticMethod1(1));
  Expect.equals(2, M.staticMethod2());
  Expect.equals(1, MA().instanceMethod1(1));
  Expect.equals(2, MA().instanceMethod2());

  Expect.equals(1, E.staticMethod1(1));
  Expect.equals(2, E.staticMethod2());
  Expect.equals(1, E.e1.instanceMethod1(1));
  Expect.equals(2, E.e1.instanceMethod2());

  Expect.equals(1, Ext.staticMethod1(1));
  Expect.equals(2, Ext.staticMethod2());
  Expect.equals(1, A().instanceMethod1(1));
  Expect.equals(2, A().instanceMethod2());

  Expect.equals(1, ET.staticMethod1(1));
  Expect.equals(2, ET.staticMethod2());
  Expect.equals(1, ET(0).instanceMethod1(1));
  Expect.equals(2, ET(0).instanceMethod2());
}
