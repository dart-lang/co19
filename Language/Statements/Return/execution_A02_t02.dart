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
/// @description Checks that if the run-time type of `o` is a not a subtype of
/// `Future<Tv>` and not a subtype of `Tv` then dynamic error occurs.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

Future<T> r<T>(T r) async => r;

Future<int> foo() async {
  return r<num>(1) as dynamic;
}

Future<int> bar() async {
  return 3.14 as dynamic;
}

main() async {
  var success = false;
  asyncStart(2);
  foo().then((_) {
    success = true;
  }).onError((_, _) {
    asyncEnd();
  }).whenComplete(() {
    Expect.isFalse(success);
  });

  bar().then((_) {
    success = true;
  }).onError((_, _) {
    asyncEnd();
  }).whenComplete(() {
    Expect.isFalse(success);
  });
}
