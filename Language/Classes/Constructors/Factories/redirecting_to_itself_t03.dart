// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor q′ is redirection-reachable
/// from a redirecting factory constructor q iff q′ is the redirectee
/// constructor of q, or q′′ is the redirectee constructor of q and q′ is
/// redirection-reachable from q′′. It is a compile-time error if a redirecting
/// factory constructor is redirection-reachable from itself.
///
/// @description Checks that compile-error occurs when a named factory
/// constructor redirects to a non-named constructor and vice versa, yielding a
/// cycle.
/// @author ilya

class F {
  factory F() = F.id;
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory F.id() = F;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F);
}
