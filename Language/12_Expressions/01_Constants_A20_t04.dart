/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression that denotes a constant variable is a
 * constant expression.
 * A simple or qualified identifier denoting a class or a type alias is a
 * constant expression.
 * @description Checks that an identifier expression that denotes a type alias
 * can be assigned to a constant variable.
 * @author ilya
 */

typedef int F(int);
typedef T FF<T>(T);

const a = F;
const b = FF;

main() {
  print(a);
  print(b);
}
