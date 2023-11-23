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
/// @description Checks that it is a compile-time error if there is a space
/// between metadata and its arguments list.
/// @author sgrekhov22@gmail.com

class Meta {
  const Meta(Type t1, Type t2);
}

class M {
  const M();
}

/**/@Meta (int, String) foo1() => (1, "2");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

/**/@Meta
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (int, String) foo2() => (3, "4");

/**/@M () foo3() => ();
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
/**/@M
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
() foo4() => ();

/**/@Meta/* comment */(int, String) foo5() => (5, "6");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

/**/@Meta // comment
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (int, String) foo6() => (7, "8");

/**/@M/* comment */ () foo7() => ();
//  ^^
// [analyzer] unspecified
// [cfe] unspecified

/**/@M // comment
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  () foo8() => ();

main() {
  foo1();
  foo2();
  foo3();
  foo4();
  foo5();
  foo6();
  foo7();
  foo8();
}
