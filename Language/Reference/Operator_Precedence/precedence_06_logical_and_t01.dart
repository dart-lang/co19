/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Logical AND        &&                                Left           6
 * @description Test that '&&' logical AND operator has precedence (6).
 * Compare with Logical OR '||' operator (precedence 5). Test that '&&' has
 * priority higher than '||'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals((true && true) || (true && false), true && true || true && false);
  Expect.notEquals(true && (true || true) && false, true && true || true && false);
}
