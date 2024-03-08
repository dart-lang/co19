// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Extension type erasure is not used during flow analysis
///
/// @description Check that an extension type erasure is not used during flow
/// analysis that isn't concerned with run-time type tests
/// @author sgrekhov22@gmail.com

extension type const ET1(int value) {
  void confirmET1() {}
}
extension type const ET2(int value) implements int {
  void confirmET2() {}
}

void main() {
  int i = 42;
  switch (i) {
    case ET1 v:
      v.confirmET1(); // This confirms that `ET1` is not erased to int
  }
  switch (i) {
    case ET2 v:
      v.confirmET2();
  }
}
