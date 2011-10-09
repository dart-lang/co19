/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All numbers support basic arithmetic operations (+, -, *, /, and 
 * %) and the standard comparison operations (<, <=, > and >=) .
 * @description Check arithmetic operations support for Rational
 * @author akuznecov
 * @needsreview Are rationals still supported?
 */


void main() {
  Expect.equals(new Rational(0.5) + new Rational(0.4), new Rational(0.9)); 
  Expect.equals(new Rational(0.4) - new Rational(0.5), new Rational(-0.1)); 
  Expect.equals(new Rational(0.5) * new Rational(0.3), new Rational(0.15)); 
  Expect.equals(new Rational(0.5) / new Rational(0.2), new Rational(2.5)); 
  Expect.equals(new Rational(0.5) % new Rational(0.2), new Rational(0.1)); 

  // comparsion
  Expect.isTrue(new Rational(2.0) < new Rational(2.1)); 
  Expect.isTrue(new Rational(0.2) < new Rational(0.3)); 
  Expect.isTrue(new Rational(0.3) > new Rational(0.2)); 
  Expect.isTrue(new Rational(0.2) <= new Rational(0.2)); 
  Expect.isTrue(new Rational(0.3) >= new Rational(0.3));

  Expect.isTrue(new Rational(-0.2) > new Rational(-0.3)); 
  Expect.isTrue(new Rational(-0.3) < new Rational(-0.2)); 
  Expect.isTrue(new Rational(-0.2) <= new Rational(-0.2)); 
  Expect.isTrue(new Rational(-0.3) >= new Rational(-0.3));

  Expect.isTrue(new Rational(0.2) > new Rational(-0.3));
  Expect.isTrue(new Rational(-0.0) >= new Rational(0.0));
  Expect.isTrue(new Rational(-0.0) <= new Rational(0.0));
  Expect.isFalse(new Rational(-0.0) < new Rational(0.0));
}
