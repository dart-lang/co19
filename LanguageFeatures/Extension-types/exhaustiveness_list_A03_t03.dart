// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that it is a compile-time error if a matched type of a
/// switch expression is a list and cases are not exhaustive.
/// @author sgrekhov22@gmail.com

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
    [_, _, _] => "3"
  };

String test1_2(ET2<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, _] => "3"
  };

String test2_1(ET1<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, _] => "3",
    [...[_]] => "-"
  };

String test2_2(ET2<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, _] => "3",
    [...[_]] => "-"
  };

String test3_1(ET1<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ... List<String> r] => "2+"
  };

String test3_2(ET2<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ... List<String> r] => "2+"
  };

main() {
  test1_1(ET1([]));
  test1_2(ET2([]));
  test2_1(ET1([]));
  test2_2(ET2([]));
  test3_1(ET1([]));
  test3_2(ET2([]));
}
