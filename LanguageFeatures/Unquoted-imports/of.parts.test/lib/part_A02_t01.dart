// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There are two directives for working with part files, `part` and
/// `part of`. This means that when the parser sees `part of`, it doesn't
/// immediately know if it is looking at a `part` directive followed by an
/// unquoted identifier like `part of`; or `part of.some/other.thing;` versus a
/// `part of` directive like `part of thing;` or `part of 'uri.dart';` It must
/// lookahead past the of identifier to see if the next token is `;`, `.`, `/`,
/// or another identifier.
///
/// @description Checks that `part of.parts.test` is parsed like a
/// `part 'package:of.parts.test/test.dart';`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

part of.parts.test;

main() {
  if (partId != "test") { // Cannot use expect.dart here
    throw "Wrong part '$partId'";
  }
}
