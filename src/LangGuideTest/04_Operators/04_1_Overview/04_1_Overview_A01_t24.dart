/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List of operators can not be overriden.
 * assignment = += -= *= /= ~/= %= <<= >>= >>>= &= ^= |= 
 * conditional ?
 * or ||
 * and &&
 * equality != === !==
 * relational is
 * call ()
 * negation/increment ! ++ --
 * @description Try to override operator --.
 * @compile-error
 * @author akuznecov
 * @reviewer msyabro
 */

main() {}

class A {
  operator --() {}
}
