// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, all other declarations of formal parameters as
/// `final` will be a compile-time error. This ensures that `final int x` is
/// unambiguously a declaring parameter. Developers who wish to maintain a style
/// whereby formal parameters are never modified will have a lint to flag all
/// such mutations.
///
/// Similarly, with this feature a regular (non-declaring) formal parameter can
/// not use the syntax `var name`, it must have a type (`T name`) or the type
/// must be omitted (`name`).
///
/// @description Check that it is a compile-time error to declare a method with 
/// a `covariant final` formal parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C {
  void instanceMethod1(covariant final v) {}
//                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2(covariant final int v) {}
//                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3([covariant final v]) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod4([covariant final int? v]) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod5({covariant final v}) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod6({covariant final int? v}) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod7({required covariant final v}) {}
//                                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod8({required covariant final int? v}) {}
//                                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  void instanceMethod1(covariant final v) {}
//                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2(covariant final int v) {}
//                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod3([covariant final v]) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod4([covariant final int? v]) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod5({covariant final v}) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod6({covariant final int? v}) {}
//                                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod7({required covariant final v}) {}
//                                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod8({required covariant final int? v}) {}
//                                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
