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
/// @description Checks that it is a compile-time error if there is a record
/// variable declaration with no space between @metadata and (a, b) r = ...
/// @author sgrekhov22@gmail.com

class Meta {
  const Meta(Type t1, Type t2);
}

class M {
  const M();
}

main() {
/**/@Meta(int, String) r1 = (1, "2");
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

/**/@M() r2 = ();
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
}
