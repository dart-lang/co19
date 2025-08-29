// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null-aware method invocation
/// For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of Null-aware method invocation.
///
/// @description Checks that code after type `Never` is unreachable.
/// @author sgrekhov22@gmail.com
/// @issue 54820, 61427

// SharedOptions=--enable-experiment=sound-flow-analysis

class C {
  Never? get foo => throw "Exception";
}

test1() {
  C c = C();
  late int i;
  if (1 > 2) {
    c.foo?.bar(i = 42);  // ignore: receiver_of_type_never, dead_code
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  C c = C();
  late int i;
  if (1 > 2) {
    c.foo?..bar(i = 0);  // ignore: receiver_of_type_never, dead_code
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
