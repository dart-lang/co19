// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is a compile-time error if the matched value type
/// of a switch expression or statement is a sealed class and the set of cases
/// is not exhaustive
/// @author sgrekhov22@gmail.com

import "exhaustiveness_lib.dart";

String test1(Face face) => switch (face) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LastPersonOnEarth _ => 'LastPersonOnEarth'
};

String test2(Face face) => switch (face) {
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  LastPersonOnEarth _ => 'Jack',
  Queen _ => 'Queen',
  King _  => 'King'
};

String test3(Face face) {
  switch (face) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    LastPersonOnEarth _: return 'LastPersonOnEarth';
  }
}

String test4(Face face) {
  switch (face) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    LastPersonOnEarth _: return 'Jack';
    Queen _: return 'Queen';
    King _: return 'King';
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
