/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • Otherwise, \k indicates the character k for any k not in
 *   {n, r, f, b, t, v, x, u}.
 * @description Checks that \k indicates the character k for any k not in
 * {n, r, f, b, t, v, x, u}.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.identical('\a', 'a');
  Expect.identical('\c', 'c');
  Expect.identical('\d', 'd');
  Expect.identical('\e', 'e');
  Expect.identical('\g', 'g');
  Expect.identical('\h', 'h');
  Expect.identical('\i', 'i');
  Expect.identical('\j', 'j');
  Expect.identical('\k', 'k');
  Expect.identical('\l', 'l');
  Expect.identical('\m', 'm');
  Expect.identical('\o', 'o');
  Expect.identical('\p', 'p');
  Expect.identical('\q', 'q');
  Expect.identical('\s', 's');
  Expect.identical('\w', 'w');
  Expect.identical('\y', 'y');
  Expect.identical('\z', 'z');

  Expect.identical('\1', '1');
  Expect.identical('\2', '2');
  Expect.identical('\3', '3');
  Expect.identical('\4', '4');
  Expect.identical('\5', '5');
  Expect.identical('\6', '6');
  Expect.identical('\7', '7');
  Expect.identical('\8', '8');
  Expect.identical('\9', '9');
  Expect.identical('\0', '0');

  Expect.identical('\!', '!');
  Expect.identical('\@', '@');
  Expect.identical('\#', '#');
  Expect.identical('\%', '%');
  Expect.identical('\^', '^');
  Expect.identical('\&', '&');
  Expect.identical('\*', '*');
}
