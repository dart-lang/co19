/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String encodeFull(String uri)
 * Encode the string uri using percent-encoding to make it safe for literal
 * use as a full URI.
 * All characters except uppercase and lowercase letters, digits
 * and the characters !$&'()*+,-./:;=?@_~ are percent-encoded.
 * This is the set of characters specified in in ECMA-262 version 5.1 for the
 * encodeURI function .
 * @description Checks that the set of characters specified in in ECMA-262
 * version 5.1 is not encoded
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

String unreserved = "0123456789" +
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
    "abcdefghijklmnopqrstuvwxyz" +
    "-" + "_" + "." + "!" + "~" + "*" + "'" + "(" + ")";
String reserved = ";" + "/" + "?" + ":" + "@" + "&" + "=" + "+" + r"$" + ",";

String mustNotBeEncoded = unreserved + reserved + "#";

main() {
  Expect.equals(mustNotBeEncoded, Uri.encodeFull(mustNotBeEncoded));
}
