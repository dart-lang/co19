// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • Otherwise, \k indicates the character k for any k not in
///   {n, r, f, b, t, v, x, u}.
/// @description Checks that \k indicates the character k for any k not in
/// {n, r, f, b, t, v, x, u}.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  const CheckIdentical('\a', 'a');
  const CheckIdentical('\c', 'c');
  const CheckIdentical('\d', 'd');
  const CheckIdentical('\e', 'e');
  const CheckIdentical('\g', 'g');
  const CheckIdentical('\h', 'h');
  const CheckIdentical('\i', 'i');
  const CheckIdentical('\j', 'j');
  const CheckIdentical('\k', 'k');
  const CheckIdentical('\l', 'l');
  const CheckIdentical('\m', 'm');
  const CheckIdentical('\o', 'o');
  const CheckIdentical('\p', 'p');
  const CheckIdentical('\q', 'q');
  const CheckIdentical('\s', 's');
  const CheckIdentical('\w', 'w');
  const CheckIdentical('\y', 'y');
  const CheckIdentical('\z', 'z');

  const CheckIdentical('\1', '1');
  const CheckIdentical('\2', '2');
  const CheckIdentical('\3', '3');
  const CheckIdentical('\4', '4');
  const CheckIdentical('\5', '5');
  const CheckIdentical('\6', '6');
  const CheckIdentical('\7', '7');
  const CheckIdentical('\8', '8');
  const CheckIdentical('\9', '9');
  const CheckIdentical('\0', '0');

  const CheckIdentical('\!', '!');
  const CheckIdentical('\@', '@');
  const CheckIdentical('\#', '#');
  const CheckIdentical('\%', '%');
  const CheckIdentical('\^', '^');
  const CheckIdentical('\&', '&');
  const CheckIdentical('\*', '*');
}
