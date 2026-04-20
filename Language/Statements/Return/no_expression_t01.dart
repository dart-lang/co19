// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement with no expression,` return;`
/// returns without an object.
///
/// @description Checks that a return statement of the form `return;` in a
/// method or getter with return type `dynamic`, `Future<dynamic>`, `Null` or
/// `Future<Null>` returns `null`.
/// @author vasya

import '../../../Utils/expect.dart';

f1() {
  return;
}

Future<dynamic> f2() async {
  return;
}

Null f3() {
  return;
}

Future<Null> f4() async {
  return;
}

class C {
  get f1 {
    return;
  }
  get f2 async {
    return;
  }
  Null get f3 {
    return;
  }
  Future<Null> get f4 async {
    return;
  }
  f5() {
    return;
  }
  Future<dynamic> f6() async {
    return;
  }
  Null f7() {
    return;
  }
  Future<Null> f8() async {
    return;
  }
}

main() async {
  final c = C();
  Expect.isNull(f1());
  Expect.isNull(await f2());
  Expect.isNull(f3());
  Expect.isNull(await f4());
  Expect.isNull(c.f1);
  Expect.isNull(await c.f2);
  Expect.isNull(c.f3);
  Expect.isNull(await c.f4);
  Expect.isNull(c.f5());
  Expect.isNull(await c.f6());
  Expect.isNull(c.f7());
  Expect.isNull(await c.f8());
}
