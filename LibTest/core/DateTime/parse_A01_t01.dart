// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion DateTime.parse(String formattedString)
/// Constructs a new [DateTime] instance based on [formattedString]
/// @description Checks that the output of toString is parsed back into
/// a DateTime object with the same time as the original.
/// @author hlodvig
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";


main() {
  DateTime now = new DateTime.now();
  DateTime parsed = DateTime.parse(now.toString());
  Expect.equals(now.microsecondsSinceEpoch, parsed.microsecondsSinceEpoch,
      "Parse: " + now.toString());
  Expect.equals(now.toString(), parsed.toString());
}
