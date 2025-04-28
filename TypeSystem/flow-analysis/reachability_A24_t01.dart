// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null-aware method invocation
/// For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of Null-aware method invocation.
///
/// @description Checks that flow analysis doesn't promote to `Null`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=sound-flow-analysis

class C {
  void foo(int x) {}
}

test1(C? c) {
  late int i;
  if (c == null) { // This doesn't promote `c` to `Null`
    c?.foo(i = 42);
  }
  i; // Possibly assigned
}

test2(C? c) {
  late int i;
  if (c == null) {
    c?..foo(i = 0)
      ..foo(0);
  }
  i;
}

main() {
  print(test1);
  print(test2);
}
