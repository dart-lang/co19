// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record expression is a potentially constant expression if and
/// only if all its field expressions are potentially constant or constant
/// expressions. This means that a record expression can be used in the
/// initializer list of a constant non-redirecting generative constructor, and
/// can depend on constructor parameters.
///
/// @description Checks that a record expression is not a potentially constant
/// expression if any of its field expressions is not a potentially constant
/// expression (which also implies that it is not a constant expression).
/// @author sgrekhov22@gmail.com

final Pi = 3.14;

class C {
  final (num, num?) r;
  const C.c1(int i): r = (i + 1, Pi);
//                       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const C.c2(): r = (Pi, null);
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
