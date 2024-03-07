// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that a switch statement/expression with map patterns only
/// cannot be exhaustive. Test the case when a matched type is an extension type
/// with a `Map` as a representation type
/// @author sgrekhov22@gmail.com

extension type ET1<K, V>(Map<K, V> _) {}
extension type ET2<K, V>(Map<K, V> _) implements Map<K, V> {}

String test1_1(ET1<bool, bool> m) =>
  switch (m) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Map(length: <= 0) => "match"
  };

String test1_2(ET2<bool, bool> m) =>
  switch (m) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Map(length: <= 0) => "match"
  };

String test2_1(ET1<bool, bool> m) {
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case Map(length: <= 0):
      return "match";
  }
// There is no return statement here, switch statement is not exhaustive, so an
// error above occurs because function return type cannot be null
}

String test2_2(ET2<bool, bool> m) {
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case Map(length: <= 0):
      return "match";
  }
}

main() {
  print(test1_1(ET1({true: false})));
  print(test1_2(ET2({true: false})));
  print(test2_1(ET1({true: false})));
  print(test2_2(ET2({true: false})));
}
