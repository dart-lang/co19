// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if two Dart files of a library do not
/// have the same language version. All Dart files in a library must have the
/// same language version. Can be expressed locally as:
/// - It's a compile-time error if the associated language version of a part
///   file is not the same as the language version of its parent file.
///
/// @description Check that it is a compile-time error if the associated
/// language version of a part file is higher than the language version of its
/// parent file.
/// @author sgrekhov22@gmail.com
/// @issue 61845

// SharedOptions=--enable-experiment=enhanced-parts

// @dart=3.10

part 'sanity_rules_A01_t04_part1.dart';

main() {
  print(C1);
  print(C2);
}
