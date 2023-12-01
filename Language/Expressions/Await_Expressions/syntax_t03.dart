// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  awaitExpression:
///      await unaryExpression
///
/// @description Check that it is a compile error if unaryExpression is missing
/// @author a.semenov@unipro.ru

import 'dart:async';

f() {
  return new Future<int>.value(1);
}

Future test() async {
  await;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test();
}
