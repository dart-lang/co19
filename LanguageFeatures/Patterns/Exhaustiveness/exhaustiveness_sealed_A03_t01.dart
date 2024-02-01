// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that the flow analysis considers a case reachable even in
/// the case where it accepts only objects of an unrelated type.
/// @author sgrekhov22@gmail.com

class A {}

class B {}

void main() {
  int x;
  A a = A();
  switch (a) {
    case B():
      print(
          '''x is not assigned here. This case looks impossible, but there can 
          be a hidden subtype of A and B in some other library''');
    case _:
      x = 1;
  }
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
