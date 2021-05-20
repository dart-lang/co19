// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let T be the static type of o.
/// ...
/// If T.m does not exist, or if F is not a function type, the static type of i
/// is Dynamic; otherwise the static type of i is the declared return type of F.
/// @description Checks static invocations, when T denotes a class in the
/// current scope. The static type of a method invocation is Dynamic when F
/// is not a function type (but can be assigned to it) by ensuring that there
/// are no static warnings when a result of such invocation is being assigned
/// to variables with various declared types.
/// @author rodionov

// Requirements=nnbd-strong
import "../../../../Utils/expect.dart";

void testme() {}

class C {
  static Function f1 = testme;
}

class A {}

main() {
  Expect.throws(() { String foo = C.f1(); });
  Expect.throws(() { bool   foo = C.f1(); });
  Expect.throws(() { A      foo = C.f1(); });
  Expect.throws(() { Object foo = C.f1(); });
  Expect.throws(() { List   foo = C.f1(); });
  Expect.throws(() { Map    foo = C.f1(); });
}
