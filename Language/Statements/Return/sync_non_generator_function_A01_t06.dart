// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
///
/// Case ⟨Synchronous non-generator functions⟩. Consider the case where `f` is a
/// synchronous non-generator function. It is a compile-time error if `s` is
/// `return;`, unless `T` is `void`, `dynamic`, or `Null`.
///
/// @description Checks that there's no compile error when a statement of the
/// form `return;` is used in a method whose return type is `void`.
/// @author a.semenov@unipro.ru

void bar() {
  return;
}

void set baz(int v) {
  return;
}

class C {
  static void sm() {
    return;
  }

  void foo() {
    return;
  }

  void set qux(int v) {
    return;
  }
}

main() {
  bar();
  baz = 0;
  C.sm();
  C().foo();
  C().qux = 1;
}
