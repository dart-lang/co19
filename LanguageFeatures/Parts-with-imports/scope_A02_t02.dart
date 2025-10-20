// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Each Dart file (library file or part file) defines a combined
/// import scope which extends the scope chain of the parent file's combined
/// import scope with its own imports and import prefixes. It is this combined
/// import scope that sub-parts inherit and override. The combined import scope
/// of a Dart file F is defined as:
///
/// - First we'll give a name to a namespace created by import statements that
///   are imported into the same namespace. Define `importsOf(S)`, where `S` is
///   a set of import directives from a single Dart file, as the namespace
///   containing the exported declarations of each library imported by one of
///   those directives, minus those hidden by a `show` or `hide` operator on the
///   import directive. Solve name conflicts the same ways as today; different
///   declarations with the same name makes the name "conflicted" unless exactly
///   one of those declarations is a non-platform-library declaration, in which
///   case the name will denote that declaration in the namespace. It's then a
///   compile-time error if an identifier denotes a conflicted namespace entry.
///   (This is the existing way to combine imported names from multiple imports
///   into a single namespace, we're just giving it a name.)
///
/// @description Check that it is a compile-time error if unprefixed imports of
/// a part file contain conflicting names and those names are referenced.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'scope_A02_t02_part1.dart';

main() {
  testPart1();
  testPart2();
}
