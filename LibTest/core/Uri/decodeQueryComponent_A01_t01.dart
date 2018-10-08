/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decodeQueryComponent(String encodedComponent,
 * {Encoding encoding: utf8})
 * Decodes the percent-encoding in encodedComponent, converting pluses
 * to spaces
 * @description Checks expected results on unreserved characters and
 * basic and extended unicode characters on manually and library
 * encoded strings.
 * @author ilya
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

String unreserved = "0123456789"
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    "abcdefghijklmnopqrstuvwxyz"
                    "-._~";

encodeOctet(int x) =>
  x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}';

manuallyEncodeQuery(String s) => s.runes
  .map((x) =>
      unreserved.runes.contains(x)
      ? new String.fromCharCode(x)
      : x == 32
        ? '+'
        : utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

main() {
  var x;
  x = 'a.A- \u0000 \u0001 \u{1D11E}';
  Expect.equals(x, Uri.decodeQueryComponent(manuallyEncodeQuery(x)));
  Expect.equals(x, Uri.decodeQueryComponent(Uri.encodeQueryComponent(x)));

  x = '~foo_BAR \uD7FF \uE000 \u{10000}';
  Expect.equals(x, Uri.decodeQueryComponent(manuallyEncodeQuery(x)));
  Expect.equals(x, Uri.decodeQueryComponent(Uri.encodeQueryComponent(x)));

  x = r"! $ & ' ( ) * + , ; = : @";
  Expect.equals(x, Uri.decodeQueryComponent(manuallyEncodeQuery(x)));
  Expect.equals(x, Uri.decodeQueryComponent(Uri.encodeQueryComponent(x)));
}
