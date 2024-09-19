// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow all reserved words and identifiers, including built-in
/// identifiers and contextual keywords as path components.
///
/// @description Checks that reserved words can be used as a path components.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import '../../Utils/expect.dart';
import test_package2/keywords/assert as l01;
import test_package2/keywords/break as l02;
import test_package2/keywords/case as l03;
import test_package2/keywords/catch as l04;
import test_package2/keywords/class as l05;
import test_package2/keywords/const as l06;
import test_package2/keywords/continue as l07;
import test_package2/keywords/default as l08;
import test_package2/keywords/do as l09;
import test_package2/keywords/else as l10;
import test_package2/keywords/enum as l11;
import test_package2/keywords/extends as l12;
import test_package2/keywords/false as l13;
import test_package2/keywords/final as l14;
import test_package2/keywords/finally as l15;
import test_package2/keywords/for as l16;
import test_package2/keywords/if as l17;
import test_package2/keywords/in as l18;
import test_package2/keywords/is as l19;
import test_package2/keywords/new as l20;
import test_package2/keywords/null as l21;
import test_package2/keywords/rethrow as l22;
import test_package2/keywords/return as l23;
import test_package2/keywords/super as l24;
import test_package2/keywords/switch as l25;
import test_package2/keywords/this as l26;
import test_package2/keywords/throw as l27;
import test_package2/keywords/true as l28;
import test_package2/keywords/try as l29;
import test_package2/keywords/var as l30;
import test_package2/keywords/void as l31;
import test_package2/keywords/while as l32;
import test_package2/keywords/with as l33;

main() {
  Expect.equals("assert", l01.libraryId);
  Expect.equals("break", l02.libraryId);
  Expect.equals("case", l03.libraryId);
  Expect.equals("catch", l04.libraryId);
  Expect.equals("class", l05.libraryId);
  Expect.equals("const", l06.libraryId);
  Expect.equals("continue", l07.libraryId);
  Expect.equals("default", l08.libraryId);
  Expect.equals("do", l09.libraryId);
  Expect.equals("else", l10.libraryId);
  Expect.equals("enum", l11.libraryId);
  Expect.equals("extends", l12.libraryId);
  Expect.equals("false", l13.libraryId);
  Expect.equals("final", l14.libraryId);
  Expect.equals("finally", l15.libraryId);
  Expect.equals("for", l16.libraryId);
  Expect.equals("if", l17.libraryId);
  Expect.equals("in", l18.libraryId);
  Expect.equals("is", l19.libraryId);
  Expect.equals("new", l20.libraryId);
  Expect.equals("null", l21.libraryId);
  Expect.equals("rethrow", l22.libraryId);
  Expect.equals("return", l23.libraryId);
  Expect.equals("super", l24.libraryId);
  Expect.equals("switch", l25.libraryId);
  Expect.equals("this", l26.libraryId);
  Expect.equals("throw", l27.libraryId);
  Expect.equals("true", l28.libraryId);
  Expect.equals("try", l29.libraryId);
  Expect.equals("var", l30.libraryId);
  Expect.equals("void", l31.libraryId);
  Expect.equals("while", l32.libraryId);
  Expect.equals("with", l33.libraryId);
}
