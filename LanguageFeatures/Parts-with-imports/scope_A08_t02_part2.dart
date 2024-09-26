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

part of 'scope_A08_t02_part1.dart';

void set l3(int _) {}

int l4() => 4;

class l5 {}

mixin l6 {}

int p1 = 1;

int get p2 => 2;

void set p3(int _) {}

int p4() => 4;

class p5 {}

mixin p6 {}

enum p7 {e0;}

extension p8 on A {}

extension type p9(int _) {}

testPart2() {
}
