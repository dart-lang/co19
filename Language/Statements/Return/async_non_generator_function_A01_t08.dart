// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
/// ...
/// Case ⟨Asynchronous non-generator functions⟩. Consider the case where `f` is
/// an asynchronous non-generator function. It is a compile-time error if `s` is
/// `return;`, unless `flatten(T)` is `void`, `dynamic`, or `Null`.
///
/// @description Checks that there's no compile-time error when a statement of
/// the form `return;` is used in an asynchronous function whose return type is
/// `void` or `Future<void>`.
/// @author sgrekhov22@gmail.com

void foo() async {
  return;
}

Future<void> bar() async {
  return;
}

class C {
  static void foo() async {
    return;
  }
  static Future<void> bar() async {
    return;
  }
  void baz() async {
    return;
  }
  Future<void> qux() async {
    return;
  }
}

main() {
  foo();
  bar();
  C.foo();
  C.bar();
  C().baz();
  C().qux();
}
