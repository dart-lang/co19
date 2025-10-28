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
/// - If a part file has a language version marker, then it's a compile-time
///   error if its parent files does not have a language version marker. The
///   version marker it has must be for the same version due to the previous
///   rule.
///
/// @description Check that it is a compile-time error if a part file has a
/// language version marker but its parent file hasn't.
/// @author sgrekhov22@gmail.com
/// @issue 61845

// SharedOptions=--enable-experiment=enhanced-parts

part of 'sanity_rules_A02_t02.dart';

part 'sanity_rules_A02_t02_part2.dart';
//   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C1 {}
