/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent single line strings are implicitly concatenated
 * to form a single string literal.
 * @description Checks that various string literal separated by a whitespace
 * are concatenated to form a single string literal.
 * @author msyabro
 */


main() {
  //Empty single-quoted strings
  '' '';
  ''
  '';
  ''@'';

  //Empty double-quoted strings
  "" "";
  ""
  "";
  ""@"";

  //Empty multi-line strings
  """""" """""";
  '''''' '''''';
  """""""""""";
  '''''''''''';

  //Empty mixed strings
  '' "";
  ''"";
  ""'';
  ""
  '';
  '''''' "";
  """"""'';
  '''''''';
  """""""";

  '' '' '';
  '' "" '';
  ""
  ""
  "";
  '' "" '''''' """""";

  //Non-empty strings
  'st' 'ring';
  "0" "1" "2" "3";
  'a''b''c''d'
  "b""";
  '1'@'2';
  """11"""'''111''';
  "${1}"'${[2, 1, 1]}';
  '''
  abc
  def''' """a
  bc""";
}