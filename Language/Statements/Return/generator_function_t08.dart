// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a return statement of the form
/// return e; appears in a generator function.
///
/// @description Check that statement 'return e' cause a compiler error in
/// asynchronous generator local function (i.e. function inside another function)
///
/// @author a.semenov@unipro.ru

import 'dart:async';

main() {
  Stream test() async* {
    return 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  test().isEmpty;
}
