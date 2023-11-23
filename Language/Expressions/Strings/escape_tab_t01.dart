// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • \t for tab, equivalent to \x09.
/// @description Checks that \t is equivalent to \x09.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  const escapeT = '\t';
  const escapeX = '\x09';

  const CheckIdentical(escapeT, escapeX);
}
