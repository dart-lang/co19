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
/// @description Checks that it is not an error if the name of a positional
/// parameter of an augmenting function is `_` and the name of this parameter in
/// the original function is not `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1(int x) {}
void topLevelFunction2([int _x = 2]) {}

augment void topLevelFunction1(int _);
augment void topLevelFunction2([int _]);

class C {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment class C {
  augment static void staticMethod1(int _);
  augment static void staticMethod2([int _]);
  augment void instanceMethod1(int _);
  augment void instanceMethod2([int _]);
}

mixin M {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment mixin M {
  augment static void staticMethod1(int _);
  augment static void staticMethod2([int _]);
  augment void instanceMethod1(int _);
  augment void instanceMethod2([int _]);
}

enum E {
  e1;
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment enum E {
  ;
  augment static void staticMethod1(int _);
  augment static void staticMethod2([int _]);
  augment void instanceMethod1(int _);
  augment void instanceMethod2([int _]);
}

class A {}

extension Ext on A {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment extension Ext {
  augment static void staticMethod1(int _);
  augment static void staticMethod2([int _]);
  augment void instanceMethod1(int _);
  augment void instanceMethod2([int _]);
}

extension type ET(int _) {
  static void staticMethod1(int _x) {}
  static void staticMethod2([int x = 2]) {}
  void instanceMethod1(int x) {}
  void instanceMethod2([int _x = 2]) {}
}

augment extension type ET {
  augment static void staticMethod1(int _);
  augment static void staticMethod2([int _]);
  augment void instanceMethod1(int _);
  augment void instanceMethod2([int _]);
}

class MA = Object with M;

main() {
  topLevelFunction1(1);
  topLevelFunction2(1);

  C.staticMethod1(1);
  C.staticMethod2();
  C().instanceMethod1(1);
  C().instanceMethod2();

  M.staticMethod1(1);
  M.staticMethod2();
  MA().instanceMethod1(1);
  MA().instanceMethod2();

  E.staticMethod1(1);
  E.staticMethod2();
  E.e1.instanceMethod1(1);
  E.e1.instanceMethod2();

  Ext.staticMethod1(1);
  Ext.staticMethod2();
  A().instanceMethod1(1);
  A().instanceMethod2();

  ET.staticMethod1(1);
  ET.staticMethod2();
  ET(0).instanceMethod1(1);
  ET(0).instanceMethod2();
}
