// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if any file of a library has a
/// language-version override marker (a line like `// @dart=3.12` before any
/// Dart code), and any other file of the same library does not have a
/// language-version override marker. While it's still possible for that library
/// to currently have the same language version across all files, that won't
/// stay true if the default language version for the package changes. Can be
/// expressed locally as:
/// ...
/// - If a part file has no language version marker, then it's a compile-time
///   error if its parent file has a language version marker.
///
/// @description Check that it is a compile-time error if a part file has no
/// language version marker but its parent file has a language version marker.
/// @author sgrekhov22@gmail.com
/// @issue 61845

// SharedOptions=--enable-experiment=enhanced-parts

// @dart=3.11

part 'sanity_rules_A02_t04_part1.dart';

main() {
  print(C1);
  print(C2);
}
