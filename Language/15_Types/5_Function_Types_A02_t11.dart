/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ..., Tk, [Tk+1, ..., Tn+k]) -> T is a subtype of the function
 * type (S1, ..., Sk+j, [Sk+j+1, ..., Sn] -> S, if all of the following conditions are met:
 * 1. Either S is void or T is assignable to S.
 * 2. Ti <=> Si for i in 1 to n.
 * @description Checks that function type t1 is a subtype of function type t2 even if t1 has less
 * required parameters but accepts the same or greater number of required and optional parameters.
 * @author iefremov
 */
import "../../Utils/expect.dart";

typedef t1(int x);
typedef t2(int x, int y);

main() {
  Expect.isTrue(([int x]) {} is t1);
  Expect.isTrue(([var x]) {} is t1);
  Expect.isTrue((int x, [int y]) {} is t2);
  Expect.isTrue(([int x, int y]) {} is t2);
}
