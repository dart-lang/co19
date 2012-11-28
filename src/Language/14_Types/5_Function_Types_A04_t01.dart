/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In addition, the following subtype rules apply:
 * (T1, ..., Tn, []) -> T <: (T1, ..., Tn) -> T.
 * (T1, ..., Tn)     -> T <: (T1, ..., Tn, {}) -> T.
 * (T1, ..., Tn, {}) -> T <: (T1, ..., Tn) -> T.
 * (T1, ..., Tn)     -> T <: (T1, ..., Tn, []) -> T.
 * @description Tests that function types with empty optional formal parameter lists
 * are assignment compatible with types without optional formal parameter lists.
 * @author rodionov
 * @needsreview issue 6921
 */

typedef int reqParamFuncType(x, int y);
typedef int posParamFuncType(xx, int yy, []);
typedef int nmdParamFuncType(xXx, int yYy, {});

int reqParamFunc(x, int y) {}
int posParamFunc(xx, int yy, []) {}
int nmdParamFunc(xXx, int yYy, {}) {}

main() {
  Expect.isTrue(reqParamFunc is posParamFuncType);
  Expect.isTrue(reqParamFunc is nmdParamFuncType);
  Expect.isTrue(posParamFunc is reqParamFuncType);
  Expect.isTrue(nmdParamFunc is reqParamFuncType);
}
