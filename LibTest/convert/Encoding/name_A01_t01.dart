/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * Name of the encoding.
 *
 * If the encoding is standardized, this is the lower-case version of one of the
 * IANA official names for the character set (see
 * http://www.iana.org/assignments/character-sets/character-sets.xml)
 * @description Checks that this property returns name of the encoding
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Expect.equals("us-ascii", Encoding.getByName("us-ascii").name);
  Expect.equals("us-ascii", Encoding.getByName("US-ASCII").name);
  Expect.equals("iso-8859-1", Encoding.getByName("iso-8859-1").name);
  Expect.equals("iso-8859-1", Encoding.getByName("ISO-8859-1").name);
  Expect.equals("utf-8", Encoding.getByName("utf-8").name);
  Expect.equals("utf-8", Encoding.getByName("UTF-8").name);
}
