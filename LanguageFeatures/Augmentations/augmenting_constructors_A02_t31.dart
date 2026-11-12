// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
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
/// declared using `_`, the name `n` is not in scope and may be resolved to an
/// instance member. Test that it is a compile-time error if `n` is used in an
/// initializer list and resolves to an instance field.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int? x;
  C(int? x);
  C.foo([int? x]);
  C.bar(int? x, {int? y});
  C.baz(int? x, {required int y});
}

augment class C {
  augment C(int? _) : x = x;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo([int? _]) : x = x;
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(1), e1.foo(1);

  final int? x;
  E(int? x);
  E.foo([int? x]);
}

augment enum E {
  ;
  augment E(int? _) : x = x;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment E.foo([int? _]) : x = x;
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? x) {
  ET.foo(int? x);
  ET.bar([int? x]);
}

augment extension type ET {
  augment ET.foo(int? _) : x = x;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar([int? _]) : x = x;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
