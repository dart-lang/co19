/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Encoding getByName(String name)
 * Gets an Encoding object from the name of the character set name. The names
 * used are the IANA official names for the character set (see
 * http://www.iana.org/assignments/character-sets/character-sets.xml).
 *
 * The name passed is case insensitive.
 * ...
 * @description Checks that this method is case insensitive
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

List<String> encodings = [
  "US-ASCII",
  "us-ascii",
  "Us-Ascii",
  "ISO-8859-1",
  "iso-8859-1",
  "Iso-8859-1",
  "iSO-8859-1",
  "UTF-8",
  "utf-8",
  "uTf-8",
];

main() {
  encodings.forEach((String encodingName) {
    Encoding e = Encoding.getByName(encodingName);
    Expect.isNotNull(e, "Encoding " + encodingName + " is not supported");
  });
}
