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
/// types do not match. Test different types of return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

var topLevelVariable = () {}; // The type is `Null Function()`

augment abstract Function() topLevelVariable; // dynamic Function()
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static var staticVariable = () {};
  var instanceVariable = () {};
}

augment class C {
  augment static Function() get staticVariable;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(Function() _);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract Function() instanceVariable;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static var staticVariable = () {};
  var instanceVariable = () {};
}

augment mixin M {
  augment static Function() get staticVariable;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(Function() _);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract Function() instanceVariable;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static var staticVariable = () {};
  final instanceVariable = () {};
}

augment enum E {
  ;
  augment static Function() get staticVariable;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(Function() _);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final Function() instanceVariable;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static var staticVariable1 = () {};
  static var staticVariable2 = () {};
}

augment extension Ext {
  augment static Function() get staticVariable1;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable1(Function() _);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Function() get staticVariable2;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable2(Function() _);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(void Function() instanceVariable) {
  static var staticVariable = () {};
}

augment extension type ET {
  augment static Function() get staticVariable;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static set staticVariable(Function() _);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final Function() instanceVariable;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
