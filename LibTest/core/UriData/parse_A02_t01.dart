/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData parse(String uri)
 * Parses a string as a data URI.
 *
 * The string must have the format:
 *
 * 'data:' (type '/' subtype)? (';' attribute '=' value)* (';base64')? ',' data
 * where type, subtype, attribute and value are specified in RFC-2045, and data
 * is a sequence of URI-characters (RFC-2396 uric).
 *
 * This means that all the characters must be ASCII, but the URI may contain
 * percent-escapes for non-ASCII byte values that need an interpretation to be
 * converted to the corresponding string.
 *
 * Parsing doesn't check the validity of any part, it just checks that the input
 * has the correct structure with the correct sequence of /, ;, = and ,
 * delimiters.
 *
 * Accessing the individual parts may fail later if they turn out to have
 * content that can't be decoded successfully as a string.
 * @description Checks that this method throws FormatException if string is not
 * valid as a data IRI
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {UriData.parse("data:text/plain;a=b;base64;,dataaaa");},
      (e) => e is FormatException);
  Expect.throws(() {UriData.parse("data:text/plain;a=b;base64;,dataaaa");},
      (e) => e is FormatException);
  Expect.throws(() {UriData.parse("http:text/plain;a=b;base64,dataaaa");},
      (e) => e is FormatException);
  Expect.throws(() {UriData.parse("data:");},
      (e) => e is FormatException);
}
