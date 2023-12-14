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

// SharedOptions=--enable-experiment=inline-class

extension type ET1<K, V>(Map<K, V> _) {}
extension type ET2<K, V>(Map<K, V> _) implements Map<K, V> {}

String test1_1(ET1<bool, bool> m) =>
  switch (m) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
  };

String test1_2(ET2<bool, bool> m) =>
  switch (m) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
  };

String test2_1(ET1<bool, bool> m) {
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case {true: true}:
      return "case-1";
    case {true: false}:
      return "case-2";
    case {false: true}:
      return "case-3";
    case {false: false}:
      return "case-4";
  }
// There is no return statement here, switch statement is not exhaustive, so an
// error above occurs because function return type cannot be null
}

String test2_2(ET2<bool, bool> m) {
//     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case {true: true}:
      return "case-1";
    case {true: false}:
      return "case-2";
    case {false: true}:
      return "case-3";
    case {false: false}:
      return "case-4";
  }
}

main() {
  print(test1_1(ET1({true: false})));
  print(test1_2(ET2({true: false})));
  print(test2_1(ET1({true: false})));
  print(test2_2(ET2({true: false})));
}
