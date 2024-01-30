// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Extension type erasure is not used during flow analysis
///
/// @description Check that an extension type erasure is not used during flow
/// analysis
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const ET1(int value) {}
extension type const ET2(int value) implements int {}

void main() {
  int i = 42;
  int x;
  switch (i) {
    case >0:
      x = 1;
    case ET1(value: var __):
      print("x not assigned here");
    case _:
      x = -1;
  }
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  switch (i) {
    case >0:
      x = 1;
    case ET2(value: var __):
      print("x not assigned here");
    case _:
      x = -1;
  }
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
