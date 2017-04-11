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
 * ...
 * If character set is not supported null is returned.
 * @description Checks that if character set is not supported null is returned.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

List<String> encodings = [
  "",
  "no",
  "!2343"
];

main() {
  encodings.forEach((String encodingName) {
    Encoding e = Encoding.getByName(encodingName);
    Expect.isNull(e, "Encoding " + encodingName + " is supported");
  });
}
