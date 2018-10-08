/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decodeFull(String uri)
 * Decodes the percent-encoding in uri.
 * @description Checks expected results on basic and extended
 * unicode characters on manually and library encoded strings.
 * @author ilya
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

encodeOctet(int x) =>
  x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}';

manuallyEncodeFull(String s) => s.runes
  .map((x) =>
      utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

main() {
  var x;
  x = 'a.A- \u0000 \u0001 \u{1D11E}';
  Expect.equals(x, Uri.decodeFull(manuallyEncodeFull(x)));
  Expect.equals(x, Uri.decodeFull(Uri.encodeFull(x)));

  x = '~foo_BAR \uD7FF \uE000 \u{10000}';
  Expect.equals(x, Uri.decodeFull(manuallyEncodeFull(x)));
  Expect.equals(x, Uri.decodeFull(Uri.encodeFull(x)));

  x = r"! # $ & ' ( ) * + , - . / : ; = ? @ _ ~";
  Expect.equals(x, Uri.decodeFull(manuallyEncodeFull(x)));
  Expect.equals(x, Uri.decodeFull(Uri.encodeFull(x)));
}
