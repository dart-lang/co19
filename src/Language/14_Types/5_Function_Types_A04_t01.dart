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
 * @description Impossible to test as users aren't allowed to
 * declare functions or function types with empty lists of optional
 * parameters.
 * @author rodionov
 * @needsreview 6921
 */

//typedef int reqParamFuncType(x, int y);
//typedef int posParamFuncType(xx, int yy, [List l]);
//typedef int nmdParamFuncType(xXx, int yYy, {Map m});
//
//int reqParamFunc(x, int y) {}
//int posParamFunc(xx, int yy, [List l]) {}
//int nmdParamFunc(xXx, int yYy, {Map m}) {}

main() {
//  Expect.isTrue(reqParamFunc is posParamFuncType);
//  Expect.isTrue(reqParamFunc is nmdParamFuncType);
}
