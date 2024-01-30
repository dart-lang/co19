// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// A constant map literal, const <K, V >{k1: v1, ..., kn: vn}, or
/// <K, V >{k1: v1, ..., kn: vn} that occurs in a constant context, is a
/// potentially constant expression. It is further a constant expression if the
/// map literal evaluates to an object.
///
/// @description Checks that a non-constant map literal cannot be assigned to
/// a constant variable.
/// @author sgrekhov22@gmail.com
/// @issue 53927

final nonconstant1 = 1;

const a1 = {1: nonconstant1};
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var a2 = const {nonconstant1: 2};
//              ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Map<int, int> get test1 => const {1: nonconstant1};
//                                   ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Map<int, int> test2() => const {nonconstant1: 2};
//                              ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  final int nonconstant2 = 1;

  const C();

  Map<int, int> get test1 => const {1: nonconstant2};
//                                     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, int> test2() => const {nonconstant2: 2};
//                                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(a1);
  print(a2);
  print(C);
}
