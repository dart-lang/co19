// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If N is an expression of the form E1.m1(E2), then:
///
///  Let before(E1) = before(N)
///  Let before(E2) = after(E2)
///  Let T be the static return type of the invocation
///  If T <: Never then:
///    Let null(N) = unreachable(before(N)).
///    Let notNull(N) = unreachable(before(N)).
///  Otherwise if T <: Null then:
///    Let null(N) = before(N).
///    Let notNull(N) = unreachable(before(N)).
///  Otherwise if T is non-nullable then:
///    Let null(N) = before(N).
///    Let notNull(N) = unreachable(before(N)).
///  Otherwise:
///    Let null(N) = promote(x, Null, before(N))
///    Let notNull(N) = promoteToNonNull(x, before(N))
///
/// @description Checks reachability after method call. Test static method and
/// return type Never
///
/// @author sgrekhov@unipro.ru


class C {
  static Never m1() => throw "Exception";
}

main() {
  try {
    late int i;
    bool b = (() => true)();
    if (b) {
      C.m1();     // The code after this point is unreachable
      i = 42;     // Variable is initialized in a dead code. This leaves it definitely unassigned
    }
    i; // It is an error to read a local late variable when it is definitely unassigned.
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (_) {
  }
}
