// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// It is a compile-time error if:
///
/// typeName does not refer to a type.
///
/// A type argument list is present and does not match the arity of the type of
/// typeName.
///
/// A patternField is of the form pattern. Positional fields aren't allowed.
///
/// Any two named fields have the same name. This applies to both explicit and
/// inferred field names.
///
/// It is a compile-time error if a name cannot be inferred for a named getter
/// pattern with the getter name omitted (see name inference below).
///
/// @description Checks that it is a compile-time error if `typeName` does not
/// refer to a type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test(Object o) => switch(o) {
  Rectangle(:var areaAsInt) => "matched",
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  _ => "no match"
//  ^^
// [analyzer] HINT.UNREACHABLE_SWITCH_CA
};

main() {
  Object o = Object();

  var Rectangle(:int areaAsInt) = o;
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final Rectangle(:sizeAsInt) = o;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  if (o case Rectangle(:var areaAsNullable)) {}
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  switch (o) {
    case Rectangle(:var areaAsNullable):
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    break;
  }
  test(o);
}
