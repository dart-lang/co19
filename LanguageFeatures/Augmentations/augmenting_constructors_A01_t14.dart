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
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the name of a
/// positional parameter of an augmenting constructor is not the same as the
/// name of the corresponding positional parameter in an introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int? x;
  C(int? _);
  C.foo([this.x]);
}

augment class C {
  augment C(int? x);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo([int? _]);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1), e1.foo();
  const E(int x);
  const E.foo([int _ = 0]);
}

augment enum E {
  ;
  augment const E(int _);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo([int x]);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(this.x);
  ET.bar(this.x, [int _ = 0]);
}

augment extension type ET {
  augment ET.foo(int _);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar(int x, [int y]);
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
