// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement s of the form return e?;
/// ...
/// It is a compile-time error if s is
///  return;, unless T is void, dynamic, or Null
///
/// @description Checks that there's a compile error when a statement of the
/// form "return;" is used in an asynchronous function whose return type is
/// Future<Object>
///
/// @Issue 42459
/// @author a.semenov@unipro.ru

import 'dart:async';

Future<Object?> bar() async {
  return;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}

class C {
  static Future<Object?> sm() async {
    return;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  Future<Object?> foo() async {
    return;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  bar();
  C.sm();
  new C().foo();
}
