// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We make a breaking change and remove support for the
/// long-deprecated library name syntax from `part of` directives. An unquoted
/// series of identifiers after `part of` then gets unambiguously interpreted as
/// this proposal's semantics. In other words, `part of foo.bar;` is part of the
/// library at `package:foo/bar.dart`, not part of the library with name
/// `foo.bar`.
///
/// @description Checks that unquoted syntax can be used in `part` and `part of`
/// directives.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports,enhanced-parts

part co19_unquoted_imports;

main() {
  if (partId != "co19_unquoted_imports.dart") { // Cannot use expect.dart here
    throw "Wrong part '$partId'";
  }
  if (partId2 != "co19_unquoted_imports_part.dart") {
    throw "Wrong part '$partId2'";
  }
}
