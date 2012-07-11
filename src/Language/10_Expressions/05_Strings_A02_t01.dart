/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion stringLiteral:
 *   MULTI_LINE_STRING+ |
 *   SINGLE_LINE_STRING
 * ;
 * MULTI_LINE_STRING:
 *   '"""' STRING CONTENT TDQ* '"""' |
 *   ''''' STRING CONTENT TSQ* ''''' |
 *   '"""'  (~ '"""')* '"""' |
 *   ''''' (~ ''''')* '''''
 * ;
 * STRING CONTENT TDQ:
 *   ~( '\' | '"""' | '$') |
 *   '\' ~( NEWLINE ) |
 *   STRING_INTERPOLATION
 * ;
 * STRING CONTENT TSQ:
 *   ~( '\' | ''''' | '$') |
 *   '\' ~( NEWLINE ) |
 *   STRING_INTERPOLATION
 * ;
 * @description Checks that various valid multi-line string literals
 * don't produce a compile-time error.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Issues 2353, 4009
 */

main() {
  '''''';
  """""";
  @'''''';
  @"""""";
  ''' ''';
  """ """;
  '''"'"'"''';
  """'''"'''""";
  """
  ""
  """;
  '''
  ''
  ''';
  ''' '' ''';
  """ "" """;
  
//issue 4009, there're negative tests for these literals
//  @'''\''';
//  @"""\""";
//  @"""$""";
//  @'''$''';

  '''
  ''';
  """
  """;

  """1234567890""";
  '''1234567890''';
  @"""1234567890""";
  @'''1234567890''';
  """12
  34
  56""";
  @'''
  89
  09
  ''';

  """abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ""";
  '''abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ''';
  @"""abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ""";
  @'''abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ''';
  @"""ABC
  ABC""";
  '''
  new line
  ''';

  """!@#%^&*(){}[]<>-_=+|~?/.,;:`""";
  '''!@#%^&*(){}[]<>-_=+|~?/.,;:`''';
  @"""!@#%^&*(){}[]<>-_=+|~?/.,;:`""";
  @'''!@#%^&*(){}[]<>-_=+|~?/.,;:`''';

  """\a\b\c\d\e\1\2\3\4\!\@\#\√\ """;
  '''\a\b\c\d\e\1\2\3\4\!\@\#\√\ ''';
  @"""\+\3\12\f""";
  @'''\~\f\ \7''';

  '''
  123
  ABC
  !@#
  ''';
  @'''
  456
  DEF
  %^&
  ''';
  """
  x1
  y2
  z()
  """;
  @"""
  x1
  &a
  +*
  """;

  //arabic
  """أبجدية
  		عربية""";
  '''أبجدية عربية''';
  //cyrillic
  """кирилл
  		и
  		ца""";
  '''кирилл
  		и
  		ца''';
  //hebrew
  """עִבְרִ
  		ית""";
  '''עִבְרִ
  		ית''';
  //roman numerals
  """ⅰ ⅱ ⅲ ⅳ ⅴ ⅵ ⅶ ⅷ ⅸ ⅹ ⅺ ⅻ ⅼ ⅽ ⅾ ⅿ""";
  '''ⅰ ⅱ ⅲ ⅳ ⅴ ⅵ ⅶ ⅷ ⅸ ⅹ ⅺ ⅻ ⅼ ⅽ ⅾ ⅿ''';
  //mathematical symbols
  """∀ ∁ ∂ ∃ ∄ ∅ ∆ ∇ ∈ ∉ ∊ ∋ ∌ ∍ ∎
  		 ∏ ∐ ∑ − ∓ ∔ ∕ ∖ ∗ ∘ ∙ √ ∛ ∜ ∝ ∞ """;
  @"""≀ ≁ ≂ ≃ ≄ ≅ ≆ ≇ ≈ ≉ ≊ ≋ ≌ ≍ ≎ ≏ ≐ 
  		≑ ≒ ≓ ≔ ≕ ≖ ≗ ≘ ≙ ≚ ≛ ≜ ≝ ≞ ≟""";
  @'''∟ ∠ ∡ ∢ ∣ ∤ ∥ ∦ ∧ ∨ ∩ ∪ ∫
  ∬ ∭ ∮ ∯ ∰ ∱ ∲ ∳ ∴ ∵ ∶ ∷ ∸ ∹ ∺ ∻ ∼ ∽ ∾ ∿''';
  '''≠ ≡ ≢ ≣ ≤ ≥ ≦ ≧ ≨ ≩ ≪ ≫ ≬ ≭ ≮ 
  ≯ ≰ ≱ ≲ ≳ ≴ ≵ ≶ ≷ ≸ ≹ ≺ ≻ ≼ ≽ ≾ ≿''';
  //some random symbols from the unicode table
  """☠ ☡ ☢ ☣ ☤ ☥ ☦ ☧ ☨ ☩ ☪ ☫ ☬ ☭ ☮ 
  		☯ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ☸ ☹ ☺ ☻ ☼ ☽ ☾ ☿""";
  @"""♀ ♁ ♂ ♃ ♄ ♅ ♆ ♇ ♈ ♉ ♊ ♋ ♌ ♍ ♎
  		 ♏ ♐ ♑ ♒ ♓ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟""";
  '''♠ ♡ ♢ ♣ ♤ ♥ ♦ ♧ ♨ ♩ ♪ ♫ ♬ ♭ 
  		 ♮ ♯ ♰ ♱ ♲ ♳ ♴ ♵ ♶ ♷ ♸ ♹ ♺ ♻ ♼ ♽ ♾ ♿''';
  @'''☀ ☁ ☂ ☃ ☄ ★ ☆ ☇ ☈ ☉ ☊ ☋ ☌ 
  ☍ ☎ ☏ ☐ ☑ ☒ ☓ ☔ ☕ ☖ ☗ ☘ ☙ ☚ ☛ ☜ ☝ ☞ ☟''';
}
