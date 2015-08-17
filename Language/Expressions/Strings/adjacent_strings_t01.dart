/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent strings are implicitly concatenated to form a single
 * string literal.
 * @description Checks that various string literal separated by whitespace
 * are concatenated to form a single string literal.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';


main() {
  //Empty single-quoted strings
  Expect.equals('', '' '');
  Expect.equals('', ''
  '');
  Expect.equals('', ''r'');

  //Empty double-quoted strings
  Expect.equals('', "" "");
  Expect.equals('', ""
  "");
  Expect.equals('', ""r"");

  //Empty multi-line strings
  Expect.equals('', """""" """""");
  Expect.equals('', '''''' '''''');
  Expect.equals('', """""""""""");
  Expect.equals('', '''''''''''');

  //Empty mixed quotes strings
  Expect.equals('', '' "");
  Expect.equals('', ''"");
  Expect.equals('', ""'');
  Expect.equals('', ""
  '');
  Expect.equals('', '''''' "");
  Expect.equals('', """"""'');
  Expect.equals('', '''''''');
  Expect.equals('', """""""");

  Expect.equals('', '' '' '');
  Expect.equals('', '' "" '');
  Expect.equals('', ""
  ""
  "");
  Expect.equals('', '' "" '''''' """""");

  //Non-empty strings
  Expect.equals('string', 'st' 'ring');
  Expect.equals('0123', "0" "1" "2" "3");
  Expect.equals('abcdb', 'a''b''c''d'
  "b""");
  Expect.equals('12', '1'r'2');
  Expect.equals('11111', """11"""'''111''');
  Expect.equals('1[2, 1, 1]', "${1}"'${[2, 1, 1]}');
  Expect.equals('  abc\n  defa\n  bc', '''
  abc
  def''' """a
  bc""");
}
