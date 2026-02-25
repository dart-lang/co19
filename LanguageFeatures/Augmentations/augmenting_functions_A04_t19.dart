// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
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
