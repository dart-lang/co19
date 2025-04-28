// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null-aware method invocation
/// For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of Null-aware method invocation.
///
/// @description Checks that is come variable is promoted to non-nullable then
/// null-aware method invocation is treated as a regular invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=sound-flow-analysis

class C {
  void foo(int x) {}
}

test1(C? c) {
  int i;
  if (c != null) {
    c?.foo(i = 42); // ignore: invalid_null_aware_operator
  } else {
    i = 0;
  }
  i; // Definitely assigned
}

test2(C? c) {
  int i;
  if (c != null) {
    c?..foo(0)  // ignore: invalid_null_aware_operator
      ..foo(i = 42);
  } else {
    i = 1;
  }
  i; // Definitely assigned
}

main() {
  test1(C());
  test1(null);
  test2(C());
  test2(null);
}
