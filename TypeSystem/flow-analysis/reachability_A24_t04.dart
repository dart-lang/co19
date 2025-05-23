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
  int i;
  if (c == null) {  // This doesn't promote `c` to `Null`
    c?.m1();
    i = 42;
  } else {
    i = 42;
  }
  i; // Definitely assigned
}

test2(C? c) {
  late int i;
  if (c == null) {
    c?..m1();
    i = 42;
  } else {
    i = 42;
  }
  i;
}

main() {
  test1(C());
  test1(null);
  test2(C());
  test2(null);
}
