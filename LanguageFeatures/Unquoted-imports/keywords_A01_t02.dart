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
import test_package1/keywords/abstract as l01;
import test_package1/keywords/as as l02;
import test_package1/keywords/covariant as l03;
import test_package1/keywords/deferred as l04;
import test_package1/keywords/dynamic as l05;
import test_package1/keywords/export as l06;
import test_package1/keywords/extension as l07;
import test_package1/keywords/external as l08;
import test_package1/keywords/factory as l09;
import test_package1/keywords/Function as l10;
import test_package1/keywords/get as l11;
import test_package1/keywords/implements as l12;
import test_package1/keywords/import as l13;
import test_package1/keywords/interface as l14;
import test_package1/keywords/late as l15;
import test_package1/keywords/library as l16;
import test_package1/keywords/mixin as l17;
import test_package1/keywords/operator as l18;
import test_package1/keywords/part as l19;
import test_package1/keywords/required as l20;
import test_package1/keywords/set as l21;
import test_package1/keywords/static as l22;
import test_package1/keywords/typedef as l23;

main() {
  Expect.equals("abstract", l01.libraryId);
  Expect.equals("as", l02.libraryId);
  Expect.equals("covariant", l03.libraryId);
  Expect.equals("deferred", l04.libraryId);
  Expect.equals("dynamic", l05.libraryId);
  Expect.equals("export", l06.libraryId);
  Expect.equals("extension", l07.libraryId);
  Expect.equals("external", l08.libraryId);
  Expect.equals("factory", l09.libraryId);
  Expect.equals("Function", l10.libraryId);
  Expect.equals("get", l11.libraryId);
  Expect.equals("implements", l12.libraryId);
  Expect.equals("import", l13.libraryId);
  Expect.equals("interface", l14.libraryId);
  Expect.equals("late", l15.libraryId);
  Expect.equals("library", l16.libraryId);
  Expect.equals("mixin", l17.libraryId);
  Expect.equals("operator", l18.libraryId);
  Expect.equals("part", l19.libraryId);
  Expect.equals("required", l20.libraryId);
  Expect.equals("set", l21.libraryId);
  Expect.equals("static", l22.libraryId);
  Expect.equals("typedef", l23.libraryId);
}
