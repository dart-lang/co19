/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  an import ...
 * @description Check that metadata is allowed before import directive
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

import 'before_import_lib1.dart';

main() {
  Symbol libraryName = MirrorSystem.getSymbol('before_import_lib1');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(libraryName);
  LibraryDependencyMirror importMirror = libraryMirror.libraryDependencies[0];
  Expect.equals('before_import_lib1.A',
      MirrorSystem.getName(importMirror.metadata[0].type.qualifiedName));
}
