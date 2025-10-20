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

/* A file relationship graph can be shown on github.com as follows:
```mermaid
graph BT;
  Lib["import_inheritance_A01_t01.dart"]
  -->|import| PartsLib["parts_lib.dart\nlibVar, LibClass, libGetter, LibMixin"]
  Lib1["...lib1.dart\nlibVar, LibClass, foo, C"]
  Part1["...part1.dart"] -->|part of| Lib
  Part1 -->|import| Lib1
  Part2["...part2.dart"] -->|part of| Part1
  Lib2["...lib2.dart\nlibGetter, LibMixin, foo, C"]
  Part2 -->|import| Lib2
```
*/

import 'parts_lib.dart';
import '../../Utils/expect.dart';

part 'import_inheritance_A01_t01_part1.dart';

main() {
  Expect.equals("libVar", libVar);
  Expect.equals("LibClass", LibClass.id);
  Expect.equals("libGetter", libGetter);
  Expect.equals("LibMixin", LibMixin.id);
  testPart1();
  testPart2();
}
