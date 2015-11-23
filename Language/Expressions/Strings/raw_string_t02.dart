/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any string may be prefixed with the character 'r',
 * indicating that it is a raw string, in which case no escapes or
 * interpolations are recognized.
 * @description Checks that string interpolation is not performed for raw
 * strings.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  String a = 'b';
  Expect.isTrue('$a' == 'b');
  Expect.isFalse(r'$a' == 'b');
  Expect.isTrue (r'$a' == '\$a');
}
