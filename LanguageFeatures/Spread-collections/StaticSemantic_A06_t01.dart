// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error if:
///    A spread element in a map literal has a static type that is not assignable
///    to [Map<Object, Object>].
///
/// @description Checks that compile error is thrown if spread element in map
/// literal is not assignable to [Map<Object, Object>]
/// @author iarkh@unipro.ru

import "dart:collection";

class MyIterable<T> extends IterableBase<T> {
  late MyIterator<T> iterator;
  MyIterable() { iterator = MyIterator(); }
  Iterator getIterator<T>() => iterator;
}

class MyIterator<T> implements Iterator<T> {
  @override
  bool moveNext() { return false; }

  @override
  T get current => throw "Should not reach here!";
}

main() {
  test1();
  test2();
}

void test1() {
  var number = 1;
  var str = "checkme";
  var list = [1, 2, 3, 4, 5];
  var itr = new MyIterator();

  var m1  = <dynamic, dynamic>{...number};
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var m2  = <dynamic, dynamic>{...str};
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var m3  = <dynamic, dynamic>{...list[0]};
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var m4  = <dynamic, dynamic>{...itr};
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2() {
  var number = 1 as int?;
  var str = "checkme" as String?;
  var list = [1, 2, 3, 4, 5] as List?;
  var itr = new MyIterator() as Iterator?;

  var m5  = <dynamic, dynamic>{...?number};
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var m6  = <dynamic, dynamic>{...?str};
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var m7  = <dynamic, dynamic>{...?list[0]};
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  var m8 = <dynamic, dynamic>{...?itr};
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
