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
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if a constructor
/// augmentation specifies a type of formal parameter which were not explicitly
/// specified in the introductory constructor and this type is not `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C(x);
  C.foo({x});
  C.bar([x]);
  C.baz({required x});
}

augment class C {
  augment C(int this.x);
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.foo({this.x = 0});
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.bar([int x = 0]) : x = x;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment C.baz({required int x}) : x = x;
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final int x;
  const E(x);
  const E.foo({x});
  const E.bar([x]);
  const E.baz({required x});
}

augment enum E {
  ;
  augment const E(int this.x);
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo({this.x = 0});
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar([int x = 0]) : x = x;
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.baz({required int x}) : x = x;
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(x);
  ET.bar({x});
  ET.baz([x]);
  ET.qux({required x});
}

augment extension type ET {
  augment ET.foo(int this.x);
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.bar({this.x = 0});
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.baz([int x = 0]) : x = x;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET.qux({required int x}) : x = x;
//                         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
