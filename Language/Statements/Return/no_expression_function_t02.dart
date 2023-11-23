// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement s of the form return e?;
/// ...
/// It is a compile-time error if s is
///  return;, unless T is void, dynamic, or Null
///
/// @description Checks that a compile error occurs if a statement of the form
/// "return;" is used in a getter method whose declared return type is bool.
///
/// @Issue 42459
/// @author vasya


class C {
  C() { }
  bool get foo {
    return;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  bool x = new C().foo;
}
