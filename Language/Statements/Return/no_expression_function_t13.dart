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
/// `Future<Null>`.
/// @author a.semenov@unipro.ru

import 'dart:async';

Future<Null> foo() async {
  return;
}

class C {
  static Future<Null> bar() async {
    return;
  }
  Future<Null> baz() async {
    return;
  }
}

main() {
  foo();
  C.bar();
  C().baz();
}
