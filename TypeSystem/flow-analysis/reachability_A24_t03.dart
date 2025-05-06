// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null-aware method invocation
/// For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of Null-aware method invocation.
///
/// @description Checks reachability after method call. Test return type `Never`
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=sound-flow-analysis

class C {
  Never m1() => throw "Exception";
}

test1(C? c) {
  try {
    late int i;
    if (c != null) {
      c?.m1();    // ignore: invalid_null_aware_operator
      i = 42;     // This is dead code, which leaves `i` definitely unassigned.
    }
    i; // Definitely unassigned.
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (_) {
  }
}

test2(C? c) {
  try {
    late int i;
    if (c != null) {
      c?..m1(); // ignore: invalid_null_aware_operator
      i = 42;
    }
    i;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (_) {
  }
}

main() {
  test1(C());
  test1(null);
  test2(C());
  test2(null);
}
