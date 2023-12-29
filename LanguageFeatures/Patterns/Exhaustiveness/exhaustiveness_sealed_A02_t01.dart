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
      Jack _ => 'Jack',
      Queen _ => 'Queen'
    };

String test2(Face<num> face) => switch (face) {
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Jack<num> _ => 'Jack',
      Queen<int> _ => 'Queen',
      King<double> _ => 'King'
    };

String test3<T extends num>(Face<T> face) => switch (face) {
//                                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      Jack<num> _ => 'Jack',
      Queen<int> _ => 'Queen',
      King<T> _ => 'King'
    };

String test4(Face face) {
  switch (face) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Jack _:
      return 'Jack';
    case Queen _:
      return 'Queen';
  }
}

String test5(Face<num> face) {
  switch (face) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Jack<num> _:
      return 'Jack';
    case Queen<int> _:
      return 'Queen';
    case King<double> _:
      return 'King';
  }
}

String test6<T extends num>(Face<T> face) {
  switch (face) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Jack<num> _:
      return 'Jack';
    case Queen<int> _:
      return 'Queen';
    case King<T> _:
      return 'King';
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
}
