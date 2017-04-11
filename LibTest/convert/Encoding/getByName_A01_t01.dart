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
 *
 * If character set is not supported null is returned.
 * @description Checks that this method returns instance of the Encoding for
 * valid encoding name
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

List<String> encodings = [
  "US-ASCII",
  "ISO-8859-1",
  //"ISO_8859-2:1987",
  //"ISO-8859-3",
  //"ISO-8859-4",
  //"ISO-8859-5",
  //"ISO-8859-6",
  //"ISO-8859-7",
  //"ISO-8859-8",
  //"ISO-8859-9",
  //"ISO-8859-10",
  //"Shift_JIS",
  //"EUC-JP",
  //"ISO-2022-KR",
  //"EUC-KR",
  //"ISO-2022-JP",
  //"ISO-2022-JP-2",
  //"ISO-8859-6-E",
  //"ISO-8859-6-I",
  //"ISO-8859-8-E",
  //"ISO-8859-8-I",
  //"GB2312",
  //"Big5",
  //"KOI8-R"
  "UTF-8"
];

main() {
  encodings.forEach((String encodingName) {
    Encoding e = Encoding.getByName(encodingName);
    Expect.isNotNull(e, "Encoding " + encodingName + " is not supported");
  });
}
