// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
/// ...
/// When an augmentation must have the "same type parameters" as an
/// introductory declaration, that means:
/// - They must have the same number of type parameters (which may be zero).
/// - For each corresponding pair of type parameters:
///   - They must have the same name (same identifier).
///   - Their bounds must be the same type. This is after any omitted bound in
///     an introductory declaration has been given a default bound of `Object?`
///     and where any omitted bound in an augmentation has been inherited from
///     the introductory declaration.
///
/// @description Checks that it is not an error if an introductory function
/// omits the bound of a type parameter and an augmenting function specifies the
/// bound `Object?`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

typedef NullableInt = int?;

String topLevelFunction<T>() => "$T";

augment String topLevelFunction<T extends Object?>();

class C {
  static String staticMethod<T>() => "$T";
  String instanceMethod<T>() => "$T";
}

augment class C {
  augment static String staticMethod<T extends Object?>();
  augment String instanceMethod<T extends Object?>();
}

mixin M {
  static String staticMethod<T>() => "$T";
  String instanceMethod<T>() => "$T";
}

augment mixin M {
  augment static String staticMethod<T extends Object?>();
  augment String instanceMethod<T extends Object?>();
}

enum E {
  e0;
  static String staticMethod<T>() => "$T";
  String instanceMethod<T>() => "$T";
}

augment enum E {
  ;
  augment static String staticMethod<T extends Object?>();
  augment String instanceMethod<T extends Object?>();
}

class A {}

extension Ext on A {
  static String staticMethod<T>() => "$T";
  String instanceMethod<T>() => "$T";
}

augment extension Ext {
  augment static String staticMethod<T extends Object?>();
  augment String instanceMethod<T extends Object?>();
}

extension type ET(int _) {
  static String staticMethod<T>() => "$T";
  String instanceMethod<T>() => "$T";
}

augment extension type ET {
  augment static String staticMethod<T extends Object?>();
  augment String instanceMethod<T extends Object?>();
}

class MA = Object with M;

main() {
  Expect.equals("$NullableInt", topLevelFunction<NullableInt>());
  Expect.equals("$NullableInt", C.staticMethod<NullableInt>());
  Expect.equals("$NullableInt", C().instanceMethod<NullableInt>());
  Expect.equals("$NullableInt", M.staticMethod<NullableInt>());
  Expect.equals("$NullableInt", MA().instanceMethod<NullableInt>());
  Expect.equals("$NullableInt", E.staticMethod<NullableInt>());
  Expect.equals("$NullableInt", E.e0.instanceMethod<NullableInt>());
  Expect.equals("$NullableInt", Ext.staticMethod<NullableInt>());
  Expect.equals("$NullableInt", A().instanceMethod<NullableInt>());
  Expect.equals("$NullableInt", ET.staticMethod<NullableInt>());
  Expect.equals("$NullableInt", ET(0).instanceMethod<NullableInt>());
}
