// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow all reserved words and identifiers, including built-in
/// identifiers and contextual keywords as path components.
///
/// @description Checks that built-in identifiers can be used as a path
/// components.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import '../../Utils/expect.dart';
import test_package2/keywords/abstract as l01;
import test_package2/keywords/as as l02;
import test_package2/keywords/augment as l03;
import test_package2/keywords/covariant as l04;
import test_package2/keywords/deferred as l05;
import test_package2/keywords/dynamic as l06;
import test_package2/keywords/export as l07;
import test_package2/keywords/extension as l08;
import test_package2/keywords/external as l09;
import test_package2/keywords/factory as l10;
import test_package2/keywords/Function as l11;
import test_package2/keywords/get as l12;
import test_package2/keywords/implements as l13;
import test_package2/keywords/import as l14;
import test_package2/keywords/interface as l15;
import test_package2/keywords/late as l16;
import test_package2/keywords/library as l17;
import test_package2/keywords/mixin as l18;
import test_package2/keywords/operator as l19;
import test_package2/keywords/part as l20;
import test_package2/keywords/required as l21;
import test_package2/keywords/set as l22;
import test_package2/keywords/static as l23;
import test_package2/keywords/typedef as l24;

main() {
  Expect.equals("abstract", l01.libraryId);
  Expect.equals("as", l02.libraryId);
  Expect.equals("augment", l03.libraryId);
  Expect.equals("covariant", l04.libraryId);
  Expect.equals("deferred", l05.libraryId);
  Expect.equals("dynamic", l06.libraryId);
  Expect.equals("export", l07.libraryId);
  Expect.equals("extension", l08.libraryId);
  Expect.equals("external", l09.libraryId);
  Expect.equals("factory", l10.libraryId);
  Expect.equals("Function", l11.libraryId);
  Expect.equals("get", l12.libraryId);
  Expect.equals("implements", l13.libraryId);
  Expect.equals("import", l14.libraryId);
  Expect.equals("interface", l15.libraryId);
  Expect.equals("late", l16.libraryId);
  Expect.equals("library", l17.libraryId);
  Expect.equals("mixin", l18.libraryId);
  Expect.equals("operator", l19.libraryId);
  Expect.equals("part", l20.libraryId);
  Expect.equals("required", l21.libraryId);
  Expect.equals("set", l22.libraryId);
  Expect.equals("static", l23.libraryId);
  Expect.equals("typedef", l24.libraryId);
}
