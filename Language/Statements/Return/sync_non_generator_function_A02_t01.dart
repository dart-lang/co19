// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
///
/// Case ⟨Synchronous non-generator functions⟩. Consider the case where `f` is a
/// synchronous non-generator function.
/// ...
/// It is a compile-time error if `s` is `return e;`, `T` is `void`, and `S` is
/// neither `void`, `dynamic`, nor `Null`.
///
/// @description Checks that returning the result of a `void` method invocation
/// from within a `void` method does not cause any errors or warnings.
/// @author rodionov

void foo() {}

void bar() {
  return foo();
}

main() {
  bar();
}
