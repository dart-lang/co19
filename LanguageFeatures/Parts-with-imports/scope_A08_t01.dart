// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if any file declares an import prefix
/// with the same base name as a top-level declaration of the library.
///
/// @description Check that it is a compile-time error if a part-file declares
/// an import prefix with the same base name as a top-level declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'scope_A08_t01_part1.dart';

int l1 = 1;
int get l2 => 2;
void set l3(int _) {}
int l4() => 4;

class l5 {}
mixin l6 {}
enum l7 {e0;}
class A {}
extension l8 on A {}
extension type l9(int _) {}

main() {
  testPart1();
  testPart2();
}
