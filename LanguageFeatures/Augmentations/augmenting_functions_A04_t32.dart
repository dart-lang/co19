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
/// @description Checks that it is not an error if an augmentation with a
/// wildcard introduces a default value for optional positional parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int topLevelFunction([int x]) => x;

augment int topLevelFunction([int _ = 0]);

class C {
  static int staticMethod([int x]) => x;
  int instanceMethod([int x]) => x;
}

augment class C {
  augment static int staticMethod([int _ = 0]);
  augment int instanceMethod([int _ = 0]);
}

mixin M {
  static int staticMethod([int x]) => x;
  int instanceMethod([int x]) => x;
}

augment mixin M {
  augment static int staticMethod([int _ = 0]);
  augment int instanceMethod([int _ = 0]);
}

enum E {
  e0;
  static int staticMethod([int x]) => x;
  int instanceMethod([int x]) => x;
}

augment enum E {
  ;
  augment static int staticMethod([int _ = 0]);
  augment int instanceMethod([int _ = 0]);
}

class A {}

extension Ext on A {
  static int staticMethod([int x]) => x;
  int instanceMethod([int x]) => x;
}

augment extension Ext {
  augment static int staticMethod([int _ = 0]);
  augment int instanceMethod([int _ = 0]);
}

extension type ET(int _) {
  static int staticMethod([int x]) => x;
  int instanceMethod([int x]) => x;
}

augment extension type ET {
  augment static int staticMethod([int _ = 0]);
  augment int instanceMethod([int _ = 0]);
}

class MA = Object with M;

main() {
  Expect.equals(0, topLevelFunction());
  Expect.equals(0, C.staticMethod());
  Expect.equals(0, C().instanceMethod());
  Expect.equals(0, M.staticMethod());
  Expect.equals(0, MA().instanceMethod());
  Expect.equals(0, E.staticMethod());
  Expect.equals(0, E.e0.instanceMethod());
  Expect.equals(0, Ext.staticMethod());
  Expect.equals(0, A().instanceMethod());
  Expect.equals(0, ET.staticMethod());
  Expect.equals(0, ET(42).instanceMethod());
}
