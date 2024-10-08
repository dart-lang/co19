// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow all reserved words and identifiers, including built-in
/// identifiers and contextual keywords as path components.
///
/// @description Checks that `OTHER_IDENTIFIER` can be used as a path
/// components.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import '../../Utils/expect.dart';
import test_package2/keywords/async as l01;
import test_package2/keywords/base as l02;
import test_package2/keywords/hide as l03;
import test_package2/keywords/of as l04;
import test_package2/keywords/on as l05;
import test_package2/keywords/sealed as l06;
import test_package2/keywords/show as l07;
import test_package2/keywords/sync as l08;
import test_package2/keywords/type as l09;
import test_package2/keywords/when as l10;

main() {
  Expect.equals("async", l01.libraryId);
  Expect.equals("base", l02.libraryId);
  Expect.equals("hide", l03.libraryId);
  Expect.equals("of", l04.libraryId);
  Expect.equals("on", l05.libraryId);
  Expect.equals("sealed", l06.libraryId);
  Expect.equals("show", l07.libraryId);
  Expect.equals("sync", l08.libraryId);
  Expect.equals("type", l09.libraryId);
  Expect.equals("when", l10.libraryId);
}
