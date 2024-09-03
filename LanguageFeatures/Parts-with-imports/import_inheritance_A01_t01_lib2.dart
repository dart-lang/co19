// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Import inheritance is a only suggestion: Aka. other files’
/// imports cannot break your code (at least if you’re not depending on them). A
/// part file is never restricted by the imports it inherits from its parent
/// file. It can ignore and override all of them with imports of its own. That
/// allows a file, like a macro generated file, to import all its own
/// dependencies and be completely self-contained when it comes to imports.
///
/// @description Check that for the part file import, inherited from the parent,
/// can be overridden by it's own import.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

// Overrides parts_lib.dart
String get libGetter => "libGetter lib2";

mixin LibMixin {
  static final String id = "LibMixin lib2";
}

// Overrides import_inheritance_A01_t01_lib1.dart
String foo() => "foo lib2";

class C {
  static final String id = "C lib2";
}
