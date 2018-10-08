/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double parse(String source, [double handleError(String source)])
 * Parse source as an double literal and return its value.
 * Accepts an optional sign (+ or -) followed by either the characters
 * "Infinity", the characters "NaN" or a floating-point representation.
 * A floating-point representation is composed of a mantissa and an optional
 * exponent part.
 * The mantissa is either a decimal point (.) followed by a sequence of
 * (decimal) digits, or a sequence of digits optionally followed by a decimal
 * point and optionally more digits.
 * The (optional) exponent part consists of the character "e" or "E", an
 * optional sign, and one or more digits.
* @description Checks that correct string can be converted to double.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(double.parse("1") == 1.0);
  Expect.isTrue(double.parse("1.0") == 1.0);
  Expect.isTrue(double.parse("-1.0") == -1.0);
  Expect.isTrue(double.parse("+1.0") == 1.0);
  Expect.isTrue(double.parse("00.000000000") == 0);
  Expect.isTrue(double.parse("-00.000000000") == 0);
  
  Expect.isTrue(double.parse(" 1.0") == 1.0);
  Expect.isTrue(double.parse("1.0 ") == 1.0);
  Expect.isTrue(double.parse("\n\t 1.0    ") == 1.0);
  
  Expect.isTrue(double.parse("-2e0") == -2.0);
  Expect.isTrue(double.parse("1.1e2") == 110);
  Expect.isTrue(double.parse("1E1") == 10);

  Expect.isTrue(double.parse("Infinity") == double.infinity);
  Expect.isTrue(double.parse("-Infinity") == double.negativeInfinity);
  Expect.isTrue(double.parse("NaN").isNaN);
  Expect.isTrue(double.parse("-NaN").isNaN);
  
  Expect.isTrue(double.parse("3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648566923460348610454326648213393607260249141273724587006606315588174881520920962829254091715364367892590360011330530548820466521384146951941511609433057270365759591953092186117381932611793105118548074462379962749567351885752724891227938183011949129833673362440656643086021394946395224737190702179860943702770539217176293176752384674818467669405132000568127145263560827785771342757789609")
   == 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648566923460348610454326648213393607260249141273724587006606315588174881520920962829254091715364367892590360011330530548820466521384146951941511609433057270365759591953092186117381932611793105118548074462379962749567351885752724891227938183011949129833673362440656643086021394946395224737190702179860943702770539217176293176752384674818467669405132000568127145263560827785771342757789609);
}
