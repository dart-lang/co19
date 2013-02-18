/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is dynamic.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that null is dynamic.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(null is dynamic);
}
