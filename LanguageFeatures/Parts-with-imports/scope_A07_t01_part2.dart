// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion That is: The combined import scope of a Dart file is a scope
/// chain of the imports and import prefixes of all the files from the current
/// to the library file. Each Dart file adds two scopes to the chain of its
/// parent, each scope able to shadow names of its enclosing scope.
///
/// The top-level namespace of a Dart library is a declaration namespace
/// containing every top-level library member declaration in every library or
/// part file of the library. The top-level scope of F has the top-level
/// namespace of `F` as namespace, and the combined import scope of `F` as
/// enclosing scope. Each Dart file has its own scope for the single shared
/// top-level namespace, but with different enclosing scopes for the imports
/// available in that file.
///
/// @description Check that it is a compile-time error to access an import
/// declared in any of part files.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A07_t01_part1.dart';

import 'parts_lib.dart';

testPart2() {
  print(libVar); // from scope_lib1.dart
  print(l1.lib2Func()); // from scope_lib2.dart
  print(counter); // from parts_lib.dart
}
