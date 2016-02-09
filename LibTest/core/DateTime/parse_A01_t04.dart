/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.parse(String formattedString)
 * Constructs a new [DateTime] instance based on [formattedString]
 * @description Checks that the output of toIso8601String is parsed back into
 * a DateTime object with the same time as the original.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  DateTime now = new DateTime.now();
  DateTime parsed = DateTime.parse(now.toIso8601String());
  Expect.equals(now.microsecondsSinceEpoch, parsed.microsecondsSinceEpoch);
  Expect.equals(now.toIso8601String(), parsed.toIso8601String());
}
