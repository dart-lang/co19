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
 * It will create a byte-list of the decoded characters, and then use [encoding]
 * to decode the byte-list to a String. The default encoding is UTF-8.
 * @description Checks that decodeQueryComponent provided with Ascii [encoding]
 * leaves Ascii strings untouched and throws on unsupported codes.
 * @author ilya
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var ascii = const AsciiCodec();

  Expect.equals('A-B', Uri.decodeQueryComponent('A-%42', encoding: ascii));
  
  Expect.throws(() {
    Uri.decodeQueryComponent(Uri.encodeComponent('\u1111'), encoding: ascii);
  });
}
