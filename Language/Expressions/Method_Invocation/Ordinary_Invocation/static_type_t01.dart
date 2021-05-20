// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let T be the static type of o.
/// ...
/// If T.m does not exist, or if F is not a function type, the static type of i
/// is Dynamic; otherwise the static type of i is the declared return type of F.
/// @description Checks that the static type of an ordinary invocation is
/// dynamic when F is not a function type (but can be assigned to it) by
/// ensuring that there're no static warnings when a result of such invocation
/// is being assigned to variables with various declared types.
/// @author rodionov

// Requirements=nnbd-strong
import '../../../../Utils/expect.dart';

void testme() {}

class C {
  Function f1 = testme;
}

class A {}

main() {
  C c = new C();

  Expect.throws(() { String foo = c.f1(); });
  Expect.throws(() { bool   foo = c.f1(); });
  Expect.throws(() { A      foo = c.f1(); });
  Expect.throws(() { Object foo = c.f1(); });
  Expect.throws(() { List   foo = c.f1(); });
  Expect.throws(() { Map    foo = c.f1(); });
}
