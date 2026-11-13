// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if a `covariant`
/// modifier of parameters of an augmentation doesn't exactly match the original
/// function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=augmentations

class C {
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
}

augment class C {
  augment void instanceMethod1(num i);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([num i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({num i});
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4({required num i});
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
}

augment mixin M {
  augment void instanceMethod1(num i);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([num i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({num i});
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4({required num i});
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
}

augment enum E {
  ;
  augment void instanceMethod1(num i);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([num i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({num i});
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4({required num i});
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
}
