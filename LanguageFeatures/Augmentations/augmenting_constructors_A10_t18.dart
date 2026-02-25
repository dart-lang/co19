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
  augment E1(int x);
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2([x]) {
  e0;
}

augment enum E2 {
  ;
  augment E2([Object? x]);
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3({x}) {
  e0;
}

augment enum E3 {
  ;
  augment E3({int x});
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4({required x}) {
  e0(x: 1);
}

augment enum E4 {
  ;
  augment E4({required Object? x});
//                     ^^^^^^^
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
