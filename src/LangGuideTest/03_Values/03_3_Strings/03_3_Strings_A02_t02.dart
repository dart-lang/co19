/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The following escape sequences are supported: 
 * - \x HexDigit1 HexDigit2: equivalent to \u{ HexDigit1 HexDigit2 }.
 * - \u HexDigit1 HexDigit2 HexDigit3 HexDigit4:
 * equivalent to \u{ HexDigit1 HexDigit2 HexDigit3 HexDigit4 }.
 * - \u{ HexDigitSequence }: is the unicode scalar value represented by the HexDigitSequence.
 * It is a resolution error if the value of the HexDigitSequence is not a valid unicode
 * scalar value. 
 * - Predefined single-character escape sequences:
 * Escape Sequence      Code Point Value        Name
 * \b                   \x08                    backspace
 * \t                   \x09                    horizontal tab
 * \n                   \x0A                    line feed (new line)
 * \v                   \x0B                    vertical tab
 * \f                   \x0C                    form feed
 * \r                   \x0D                    carriage return
 * All other since-character escapes evaluate to the value of the single character.
 * @description Checks the validity of a few strings with character escape sequences.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Assertion and check operates with different escape symbols
 */


main() {
  Expect.isTrue("ab\"cd".length == 5);
  Expect.isTrue('ab\"cd'.length == 5);

  Expect.isTrue("ab\'cd".length == 5);
  Expect.isTrue('ab\'cd'.length == 5);    

  Expect.isTrue("ab\\cd".length == 5);
  Expect.isTrue('ab\\cd'.length == 5);

  Expect.isTrue("a\Cd" == "aCd");
}
