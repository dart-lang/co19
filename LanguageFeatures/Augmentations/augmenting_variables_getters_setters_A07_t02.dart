// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// - The signature of the augmenting getter or setter does not match the
///   signature of the augmented getter or setter.
///
/// @description Check that it is a compile-time error if a function-typed
/// variable is augmented by another function-typed variable, but the function
/// types do not match. Test different return types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

var topLevelVariable1 = () => 42 as num;

augment abstract int Function() topLevelVariable1;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var topLevelVariable2 = () => 42 as num;

augment abstract Object Function() topLevelVariable2;
//               ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static var staticVariable = () => 42 as num;
  var instanceVariable = () => 42 as num;
}

augment class C {
  augment static int Function() get staticVariable;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(int Function() _);
//                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract Object Function() instanceVariable;
//                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static var staticVariable = () => 42 as num;
  var instanceVariable = () => 42 as num;
}

augment mixin M {
  augment static int Function() get staticVariable;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(int Function() _);
//                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract Object Function() instanceVariable;
//                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static var staticVariable = () => 42 as num;
  final instanceVariable = () => 42 as num;
}

augment enum E {
  ;
  augment static int Function() get staticVariable;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(int Function() _);
//                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final Object Function() instanceVariable;
//                       ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static var staticVariable1 = () => 42 as num;
  static var staticVariable2 = () => 42 as num;
}

augment extension Ext {
  augment static int Function() get staticVariable1;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable1(int Function() _);
//                                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int Function() get staticVariable2;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable2(int Function() _);
//                                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(num Function() instanceVariable) {
  static var staticVariable = () => 42 as num;
}

augment extension type ET {
  augment static int Function() get staticVariable;
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(int Function() _);
//                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final Object Function() instanceVariable;
//                       ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable1);
  print(topLevelVariable2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
