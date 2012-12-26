/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a string literal is String.
 * @description Checks that the static type of a string literal is String by
 * ensuring there're no static warnings when a string literal is being assigned
 * to a String variable in checked mode.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  String str = "";
  str = '';
  str = r'';
  str = r"";
  str = """""";
  str = '''''';
  str = r"""""";
  str = r'''''';
  str = "abc";
  str = '1234567890';
  str = r"!@#$%^&*";
  str = '''
  ''';
  str = """multiline string""";
}
