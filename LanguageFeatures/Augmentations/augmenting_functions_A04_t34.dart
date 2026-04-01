// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the introductory
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// In a declaration where a parameter named `n` is declared using `_`, the name
/// `n` is not in scope and may be resolved elsewhere.
///
/// @description Checks that in a declaration where a parameter named `n` is
/// declared using `_`, the name `n` is not in scope and may be resolved
/// elsewhere.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

final String x = 'x';

int topLevelFunction1(int x);
augment int topLevelFunction1(int _) => x;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified

int topLevelFunction2([int _]) => x;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
augment int topLevelFunction2([int x = 0]);

class C {
  static int staticMethod1(int x);
  static int staticMethod2([int _]) => x;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  int instanceMethod1(int x);
  int instanceMethod2([int _]) => x;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment static int staticMethod1(int _) => x;
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int staticMethod2([int x = 0]);
  augment int instanceMethod1(int _) => x;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceMethod2([int x = 0]);
}

mixin M {
  static int staticMethod1(int x);
  static int staticMethod2([int _]) => x;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  int instanceMethod1(int x);
  int instanceMethod2([int _]) => x;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static int staticMethod1(int _) => x;
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int staticMethod2([int x = 0]);
  augment int instanceMethod1(int _) => x;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceMethod2([int x = 0]);
}

enum E {
  e0;
  static int staticMethod1(int x);
  static int staticMethod2([int _]) => x;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  int instanceMethod1(int x);
  int instanceMethod2([int _]) => x;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment static int staticMethod1(int _) => x;
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int staticMethod2([int x = 0]);
  augment int instanceMethod1(int _) => x;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceMethod2([int x = 0]);
}

class A {}

extension Ext on A {
  static int staticMethod1(int x);
  static int staticMethod2([int _]) => x;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  int instanceMethod1(int x);
  int instanceMethod2([int _]) => x;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static int staticMethod1(int _) => x;
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int staticMethod2([int x = 0]);
  augment int instanceMethod1(int _) => x;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceMethod2([int x = 0]);
}

extension type ET(int _) {
  static int staticMethod1(int x);
  static int staticMethod2([int _]) => x;
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  int instanceMethod1(int x);
  int instanceMethod2([int _]) => x;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static int staticMethod1(int _) => x;
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int staticMethod2([int x = 0]);
  augment int instanceMethod1(int _) => x;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceMethod2([int x = 0]);
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
