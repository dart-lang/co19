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
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if a primary constructor
/// augmentation specifies a type of formal parameter which were not explicitly
/// specified in the introductory constructor and this type is not `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1(x) {}

augment class C1 {
  augment C1(int x);
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2([x]) {}

augment class C2 {
  augment C2([Object? x]);
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3({x}) {}

augment class C3 {
  augment C3({int x});
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4({required x}) {}

augment class C4 {
  augment C4({required Object? x});
//                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(x) {
  e0(0);
}

augment enum E1 {
  ;
  augment const E1(int x);
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2([x]) {
  e0;
}

augment enum E2 {
  ;
  augment const E2([Object? x]);
//                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3({x}) {
  e0;
}

augment enum E3 {
  ;
  augment const E3({int x});
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4({required x}) {
  e0(x: 1);
}

augment enum E4 {
  ;
  augment const E4({required Object? x});
//                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
