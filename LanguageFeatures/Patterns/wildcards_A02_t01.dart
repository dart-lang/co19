// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// If the variable's name is _, it doesn't bind any variable. This "wildcard"
/// name is useful as a placeholder in places where you need a subpattern in
/// order to destructure later positional values:
/// ```dart
/// var list = [1, 2, 3];
/// var [_, two, _] = list;
/// ```
/// The `_` identifier can also be used with a type annotation when you want to
/// test a value's type but not bind the value to a name:
/// ```dart
/// switch (record) {
///   case (int _, String _):
///     print('First field is int and second is String.');
/// }
/// ```
/// @description Check that if variable name is _, it doesn't bind any variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

testRecord(Record r) {
  switch (r) {
    case (_, String s):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (r) {
    case (var _, String s):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (r) {
    case (final _, String s):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (r) {
    case (int _, String s):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (r) {
    case (final int _, String s):
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

testList(List list) {
  switch (list) {
    case [_, String s]:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (list) {
    case [var _, String s]:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (list) {
    case [final _, String s]:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (list) {
    case [final int _, String s]:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (list) {
    case [int _, String s]:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

testMap(Map map) {
  switch (map) {
    case {1: _}:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (map) {
    case {1: var _}:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (map) {
    case {1: final _}:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (map) {
    case {1: final int _}:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (map) {
    case {1: int _}:
      if (_ is int) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

testObject(Shape shape) {
  switch (shape) {
    case Rectangle(size: 1, area: _):
      if (_ == 1) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (shape) {
    case Rectangle(size: 1, area: var _):
      if (_ == 1) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (shape) {
    case Rectangle(size: 1, area: final _):
      if (_ == 1) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  switch (shape) {
    case Rectangle(size: 1, area: final Unit _):
      if (_ == 1) {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var list = [1, 2];
  var [_, _a] = list;
  var map = {1: 2};
  var {1: _} = map;

  if (_ == 1) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  testRecord(());
  testList([]);
  testMap({});
  testObject(Rectangle(1, 2));
}
