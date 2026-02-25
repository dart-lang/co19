// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if the name of a
/// positional parameter of an augmenting constructor is not the same as the
/// name of the corresponding positional parameter in an introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(int x);
  C.foo([int? _]);
}

augment class C {
  augment C(int x);
  augment C.foo([int? _]);
}

augment class C {
  augment C(int _);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo([int? x]);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1), e1.foo(1);

  const E(int _);
  const E.foo([int x]);
}

augment enum E {
  ;
  augment const E(int _);
  augment const E.foo([int x = 0]);
}

augment enum E {
  ;
  augment const E(int x);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo([int _]);
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? v) {
  ET.foo(int x);
  ET.bar([int _]);
}

augment extension type ET {
  augment ET.foo(int x);
  augment ET.bar([int _ = 0]);
}

augment extension type ET {
  augment ET.foo(int _);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar([int x]);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
