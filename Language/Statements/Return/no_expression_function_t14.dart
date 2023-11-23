// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement s of the form return e?;
/// ...
/// It is a compile-time error if s is
///  return;, unless T is void, dynamic, or Null
///
/// @description Checks that there's no compile error when a statement of the
/// form "return;" is used in an asynchronous function whose return type is
/// not specified
///
/// @author a.semenov@unipro.ru

bar() async {
  return;
}

class C {
  static sm() async {
    return;
  }
  foo() async {
    return;
  }
}

main() {
  bar();
  C.sm();
  new C().foo();
}
