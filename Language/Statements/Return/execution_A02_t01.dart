// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The execution of a return statement proceeds as follows.
/// ...
/// Case ⟨Asynchronous non-generator functions⟩. Let `s` be a statement of the
/// form return `e;`. Let `f` be the immediately enclosing function, and
/// consider the case where `f` is an asynchronous non-generator with future
/// value type `Tv`.
///
/// Execution of `s` proceeds as follows.
///
/// The expression `e` is evaluated to an object `o`. If the run-time type of
/// `o` is a subtype of `Future<Tv>`, let `v` be a fresh variable bound to `o`
/// and evaluate `await v` to an object `r`; otherwise let `r` be `o`. A dynamic
/// error occurs unless the dynamic type of `r` is a subtype of the actual value
/// of `Tv`. Then the return statement `s` completes returning `r`.
///
/// @description Checks that if the run-time type of `o` is a subtype of
/// `Future<Tv>` then the result of `await v;` is returned.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../Utils/expect.dart';

Future<T> r<T>(T v) async => v;

Future<num> foo() async {
  return r<int>(1);
}

FutureOr<num> bar() async {
  return r<int>(2);
}

Future<num> baz() async {
  return 3;
}

FutureOr<num> qux() async {
  return 4;
}

FutureOr<Object> quux() async {
  return r<Object>(5);
}

main() async {
  Expect.notEquals(await r(1), foo()); // The expected values are directly based on the specified behavior
  Expect.equals(await r(1), await foo());
  Expect.notEquals(await r(2), bar());
  Expect.equals(await r(2), await bar());
  Expect.notEquals(3, baz());
  Expect.equals(3, await baz());
  Expect.notEquals(4, qux());
  Expect.equals(4, await qux());
  Expect.notEquals(await r(5), quux());
  Expect.equals(await r(5), await quux());
}
