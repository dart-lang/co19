// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
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
/// @description Checks that it is not an error if the type parameters of an
/// augmentation exactly match the original function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String topLevelFunction<X, Y extends num>() => "$X, $Y";

augment String topLevelFunction<X, Y extends num>();

class C {
  static String staticMethod<X, Y extends num>() => "$X, $Y";
  String instanceMethod<X, Y extends num>() => "$X, $Y";
}

augment class C {
  augment static String staticMethod<X, Y extends num>();
  augment String instanceMethod<X, Y extends num>();
}

mixin M {
  static String staticMethod<X, Y extends num>() => "$X, $Y";
  String instanceMethod<X, Y extends num>() => "$X, $Y";
}

augment mixin M {
  augment static String staticMethod<X, Y extends num>();
  augment String instanceMethod<X, Y extends num>();
}

enum E {
  e1;
  static String staticMethod<X, Y extends num>() => "$X, $Y";
  String instanceMethod<X, Y extends num>() => "$X, $Y";
}

augment enum E {
  ;
  augment static String staticMethod<X, Y extends num>();
  augment String instanceMethod<X, Y extends num>();
}

class A {}

extension Ext on A {
  static String staticMethod<X, Y extends num>() => "$X, $Y";
  String instanceMethod<X, Y extends num>() => "$X, $Y";
}

augment extension Ext {
  augment static String staticMethod<X, Y extends num>();
  augment String instanceMethod<X, Y extends num>();
}

extension type ET(int _) {
  static String staticMethod<X, Y extends num>() => "$X, $Y";
  String instanceMethod<X, Y extends num>() => "$X, $Y";
}

augment extension type ET {
  augment static String staticMethod<X, Y extends num>();
  augment String instanceMethod<X, Y extends num>();
}

class MA = Object with M;

main() {
  Expect.equals("$String, $int", topLevelFunction<String, int>());
  Expect.equals("$String, $double", C.staticMethod<String, double>());
  Expect.equals("$String, $int", C().instanceMethod<String, int>());
  Expect.equals("$String, $double", M.staticMethod<String, double>());
  Expect.equals("$String, $int", MA().instanceMethod<String, int>());
  Expect.equals("$String, $double", E.staticMethod<String, double>());
  Expect.equals("$String, $int", E.e1.instanceMethod<String, int>());
  Expect.equals("$String, $double", Ext.staticMethod<String, double>());
  Expect.equals("$String, $int", A().instanceMethod<String, int>());
  Expect.equals("$String, $double", ET.staticMethod<String, double>());
  Expect.equals("$String, $int", ET(0).instanceMethod<String, int>());
}
