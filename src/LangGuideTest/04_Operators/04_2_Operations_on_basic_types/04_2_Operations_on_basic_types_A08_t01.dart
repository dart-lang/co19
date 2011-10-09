/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int is a subclass of type Rational.
 * @description Check that int is a subclass of type Rational
 * @author akuznecov
 * @needsreview Are rationals still supported?
 * Maybe another test that checks that
 * Rational is converted to int if possible
 */


void main() {
  Expect.isTrue(int is Rational);
  Expect.isTrue(3 is Rational);
  Expect.isTrue(3 is int);
  Expect.isTrue(3.0 is int);
  Expect.isTrue(new Rational(3) is int);
  Expect.isTrue(!(2.5 is int));
}
