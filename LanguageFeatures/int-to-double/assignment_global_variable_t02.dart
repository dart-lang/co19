/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test global variable assignment and hexadecimal values
 * @author sgrekhov@unipro.ru
 */
double g1 = 0x42;
double g2 = (1 > 0 ? 0x42 : 3.14);
double g3 = (null ?? 0x42);
const double g4 = -0x42;
final double g5 = 0x23;

main() {
  g1 = -0x42;

  g1 = null;
  g1 ??= 0x42;
  g1 ??= -0x42;
}
