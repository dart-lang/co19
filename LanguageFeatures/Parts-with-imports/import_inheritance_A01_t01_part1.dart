// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Import inheritance can be ignored: Aka. ancestor files' imports
/// shouldn't break your code (if you're not depending on them). A part file is
/// never restricted by the imports inherited from its parent file. It can
/// ignore and override all of them with imports of its own, and by making
/// explicit references to its own imported names. That allows such a file, for
/// example code-generated file, to import all its own dependencies and be
/// completely self-contained when it comes to imports.
///
/// @description Check that for the part file, an imported name which is
/// "inherited" from the parent can be overridden by it's own import.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'import_inheritance_A01_t01.dart';

import 'import_inheritance_A01_t01_lib1.dart';

part 'import_inheritance_A01_t01_part2.dart';

void testPart1() {
  Expect.equals("libVar lib1", libVar);
  Expect.equals("LibClass lib1", LibClass.id);
  Expect.equals("foo lib1", foo());
  Expect.equals("C lib1", C.id);

  Expect.equals("libGetter", libGetter);
  Expect.equals("LibMixin", LibMixin.id);
}
