// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a yield-each statement appears in
/// a function that is not a generator function.
///
/// @description Check that it is compile error if yield-each statement appears
/// inside asynchronous method.
///
/// @author a.semenov@unipro.ru

import 'dart:async';

class A {
  test() async {
    yield* new Stream<String>.fromIterable(['a']);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new A().test();
}
