// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// It is a compile-time error if:
///
/// `typeNam`e does not refer to a type.
///
/// A type argument list is present and does not match the arity of the type of
/// `typeName`.
///
/// A `patternField` is of the form `pattern`. Positional fields aren't allowed.
///
/// Any two named fields have the same name. This applies to both explicit and
/// inferred field names.
///
/// It is a compile-time error if a name cannot be inferred for a named getter
/// pattern with the getter name omitted (see name inference below).
///
/// @description Checks that it is a compile-time error if a name cannot be
/// inferred for a named getter pattern with the getter name omitted. Test the
/// case when class has a getter named `_`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

class C {
  int get _ => 42;
}

main() {
  C c = C();
  switch (c) {
    case C(:var _):
//              ^
// [analyzer] unspecified
// [cfe] unspecified
      print("matched");
      break;
    default:
      print("not matched");
  }

  if (c case C(:var _)) {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  var x = switch(c) {
    C(:final _) => "match",
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var C(:_) = C();
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  final C(:_) = C();
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  final C(:int _) = C();
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}
