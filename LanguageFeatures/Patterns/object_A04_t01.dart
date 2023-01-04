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
/// @description Checks that it is a compile-time error if a type argument list
/// is present and does not match the arity of the type of typeName.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(Object o) => switch(o) {
  Rectangle<Meter, Centimeter>(:var areaAsInt) => "matched-1",
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle<Meter, Centimeter>(areaAsInt: final x) => "matched-2",
//               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
   _ => ""
};

main() {
  Object o = Object();

  var Rectangle<Meter, Centimeter>(:int areaAsInt) = o;
//                   ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final Rectangle<Meter, Centimeter>(areaAsInt: int x) = o;
//                     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  if (o case Rectangle<Meter, Centimeter>(:var areaAsInt)) {}
//                          ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (o case Rectangle<Meter, Centimeter>(areaAsInt: final x )) {}
//                          ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  switch (o) {
    case Rectangle<Meter, Centimeter>(:var areaAsInt):
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Rectangle<Meter, Centimeter>(areaAsInt: final x):
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
  test(o);
}
