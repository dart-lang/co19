// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that the flow analysis considers a case reachable even in
/// the case where it accepts only objects of an unrelated type.
/// @author sgrekhov22@gmail.com

import 'exhaustiveness_lib.dart';

class C {}
class D extends C implements B1Class {}

void main() {
  int x;
  SClass s = D();
  switch (s) {
    case C():
      print('x is not assigned here');
    case B1Class():
      x = 1;
    case B2Class():
      x = 2;
  }
  print(x);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
