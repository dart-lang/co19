/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 *  Name of the encoding.
 *  If the encoding is standardized, this is the lower-case version of one
 *  of the IANA official names for the character set
 *  (see http://www.iana.org/assignments/character-sets/character-sets.xml)
 *
 * The system encoding is the current code page on Windows and UTF-8 on Linux
 * and Mac.
 * @description Checks that system encoding is UTF-8 on Linux and Mac
 * @author a.semenov@unipro.ru
 * @issue #31014
 * @issue #31015
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  const SystemEncoding systemEncoding = const SystemEncoding();
  if (Platform.isLinux || Platform.isMacOS) {
    Expect.equals("utf-8", systemEncoding.name);
  }
  // For windows there is no way to find current code page
}
