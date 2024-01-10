// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A switch expression with `List` as the matched value type can be
/// exhaustive, which can also make a switch expression with an extension type
/// whose representation type is `List<...>` exhaustive.
///
/// @description Check that it is a compile-time error if a matched value type
/// of a switch expression is an extension type with representation type `List`
/// and the set of cases is not exhaustive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1<T>(List<T> _) {}
extension type ET2<T>(List<T> _) implements List<T> {}

String test1_1(ET1<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, ..., _, _, _] => "4+"
  };

String test1_2(ET2<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, ..., _, _, _] => "4+"
  };

String test2_1(ET1<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_, _] => "2",
    [_, ..., _] => "2+"
  };

String test2_2(ET2<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_, _] => "2",
    [_, ..., _] => "2+"
  };

String test3_1(ET1<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [_] => "1",
    [..., _, _] => "2+"
  };

String test3_2(ET2<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [_] => "1",
    [..., _, _] => "2+"
  };

main() {
  test1_1(ET1([]));
  test1_2(ET2([]));
  test2_1(ET1([]));
  test2_2(ET2([]));
  test3_1(ET1([]));
  test3_2(ET2([]));
}
