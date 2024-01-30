// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that if a matched value of a switch statement is not a
/// sealed class then flow analysis treats this statement as a not exhaustive
/// @author sgrekhov22@gmail.com

abstract class A {}
class B extends A {}

void main() {
  int x;
  A a = B();
  switch (a) {
    case B():
      print("x not assigned here");
    case _ :
      x = 1;
  }
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
