// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor q′ is redirection-reachable
/// from a redirecting factory constructor q iff q′ is the redirectee
/// constructor of q, or q′′ is the redirectee constructor of q and q′ is
/// redirection-reachable from q′′. It is a compile-time error if a redirecting
/// factory constructor is redirection-reachable from itself.
///
/// @description Checks that compile-error occurs when factory constructor
/// redirects to itself through a cycle.
/// @author sgrekhov@unipro.ru

class F1 {
  factory F1() = F2;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
}

typedef F1Alias = F1;

class F2 {
  factory F2() = F3;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class F3 {
  factory F3() = FAlias1;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F1);
  print(F2);
  print(F3);
}
