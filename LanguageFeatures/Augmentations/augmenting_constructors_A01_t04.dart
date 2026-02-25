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
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test an
/// incorrect type of parameters in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C(num x, [num y = 0]);
  C.foo(num x, {required num y, num z = 0});
}

augment class C {
  augment C(int x, [num y]);
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C(num x, [int y]);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(Object x, {required num y, num z});
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(num x, {required Object y, num z});
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(num x, {required num y, Object z});
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(0), e1.foo(1);

  const E(num x, [num y = 0]);
  const E.foo(num x, {required num y, num z = 0});
}

augment enum E {
  ;
  augment const E(int x, [num y]);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E(num x, [int y]);
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(Object x, {required num y, num z});
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(num x, {required Object y, num z});
//                                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(num x, {required num y, Object z});
//                                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}


extension type ET(int id) {
  ET.foo(num x, [num y = 0]): this.id = 0;
  ET.baz(num x, {required num y, num z = 0}): this.id = 0;
}

augment extension type ET {
  augment ET.foo(int x, [num y = 0]);
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(num x, [int y = 0]);
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz(Object x, {required num y, num z = 0});
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz(num x, {required Object y, num z = 0});
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.baz(num x, {required num y, Object z = 0});
//                                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
