/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All comparison operations return a boolean.
 * @description Ensure that result of <, >, <= and => operator on int is boolean.
 * @author akuznecov
 */

// note since these operators can be overloaded, 
// the return types of overloaded operators must be checked too


void main() {
  Expect.isTrue((1 < 2) is bool);
  Expect.isTrue((1 > 2) is bool);
  Expect.isTrue((1 <= 2) is bool);
  Expect.isTrue((1 >= 2) is bool);
}
