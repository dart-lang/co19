// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All string literals implement the built-in class String.
/// @description Checks that string literals implement class String.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  checkType(checkIs<String>, true, "");
  checkType(checkIs<String>, true, '');
  checkType(checkIs<String>, true, r"");
  checkType(checkIs<String>, true, r'');
  checkType(checkIs<String>, true, """""");
  checkType(checkIs<String>, true, '''''');
  checkType(checkIs<String>, true, r"""""");
  checkType(checkIs<String>, true, r'''''');

  checkType(checkIs<String>, true, "String");
  checkType(checkIs<String>, true, '\x00\x01\x02');
  checkType(checkIs<String>, true, r"\\\\\\\\");
  checkType(checkIs<String>, true, r'$$$$$');
  checkType(checkIs<String>, true, """
                new line """);
}
