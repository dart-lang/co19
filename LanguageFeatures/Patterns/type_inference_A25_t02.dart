// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Variable:
///
/// If the variable has a type annotation, the required type of p is that type,
/// as is the static type of the variable introduced by p.
///
/// Else the required type of p is M, as is the static type of the variable
/// introduced by p
///
/// @description Check that if a variable pattern `p` has a type annotation,
/// then the required type of `p` is that type. Test that it is a compile-time
/// error if in an irrefutable context the static type of the M is not
/// assignable to the type of the variable pattern
/// @author sgrekhov22@gmail.com

main() {
  var (num v1) = "42";
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (num v2) = "42";
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var <int>[v3] = <num>[42];
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final <int>[v4] = <num>[42];
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
