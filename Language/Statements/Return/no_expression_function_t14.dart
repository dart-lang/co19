// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that there's no compile error when a statement of the
/// form `return;` is used in an asynchronous function whose return type is
/// `dynamic` or `Future<dynamic>`.
/// @author a.semenov@unipro.ru

foo() async {
  return;
}

Future<dynamic> bar() async {
  return;
}

class C {
  static dynamic foo() async {
    return;
  }
  static Future<dynamic> bar() async {
    return;
  }
  baz() async {
    return;
  }
  Future<dynamic> qux() async {
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
