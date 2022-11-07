// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion @metadata (a, b) function() {}
/// This could be a metadata annotation @metadata(a, b) associated with a
/// function declaration with no return type. Or it could be a metadata
/// annotation @metadata associated with a function whose return type is the
/// record type (a, b).
///
/// In practice, idiomatically written code is clear thanks to whitespace:
///
/// @metadata(a, b) function() {}
///
/// @metadata (a, b) function() {}
///
/// The former applies (a, b) to the metadata annotation and the latter is a
/// return type. We disambiguate in the same way, by making whitespace after a
/// metadata annotation name significant. Change the grammar to:
///
/// metadatum ::= identifier                                 // Existing rule.
///             | qualifiedName                              // Existing rule.
///             | constructorDesignation NO_SPACE arguments  // Changed.
/// The NO_SPACE lexical rule matches when there are no whitespace characters or
/// comments (according to the existing WHITESPACE and COMMENT lexical rules)
/// between the constructorDesignation and arguments. In other words, for an
/// argument list to be part of the metadata annotation, the ( must occur
/// immediately after the last character in the constructorDesignation. The last
/// character in constructorDesignation may be an identifier or the > in a type
/// argument list.
///
/// @description Checks that if there is a space between @metadata and (a, b)
/// then (a, b) denotes a record. Test variables declaration with no comment
/// between a metadata and a return type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

const Meta = "meta";

main() {
  @Meta (int, String) r1 = (1, "2");

  @Meta
  (int, String) r2 = (3, "4");

  @Meta () r3 = ();

  @Meta
  () r4 = ();

  @Meta (int, {String name}) r5 = (5, name: "name");

  Expect.equals(1, r1.$0);
  Expect.equals("2", r1.$1);
  Expect.equals(3, r2.$0);
  Expect.equals("4", r2.$1);
  Expect.equals((), r3);
  Expect.equals((), r4);
  Expect.equals(5, r5.$0);
  Expect.equals("name", r5.name);
}
