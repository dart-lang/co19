// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a Dart file has two `part`
/// directives with the same URI, so each included part file is included exactly
/// once.
///
/// @description Check that it is a compile-time error if a Dart file has two
/// `part` directives with the same URI.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'terminology_A01_t01_part1.dart';

main() {
}
