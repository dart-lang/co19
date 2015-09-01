/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is dynamic.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that any type (interface type, function type, generic) is (more specific than) dynamic.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

List<Map<List, Map>> f1(num n, Object o, [var x, List y]) {}

main() {
  Expect.isTrue(new Object() is dynamic);
  Expect.isTrue(1 is dynamic);
  Expect.isTrue(0.0 is dynamic);
  Expect.isTrue("" is dynamic);
  Expect.isTrue(true is dynamic);
  Expect.isTrue(false is dynamic);
  Expect.isTrue(new List() is dynamic);
  Expect.isTrue(new List<Map<List, List<int>>>() is dynamic);
  Expect.isTrue(() {} is dynamic);
  Expect.isTrue((num n, Object o, [var x, List y]) {} is dynamic);
  Expect.isTrue(f1 is dynamic);
}
