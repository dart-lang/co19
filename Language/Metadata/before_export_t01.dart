/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  export ...
 * @description Check that metadata is allowed before export directive
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

import 'before_export_lib1.dart';

main() {
  Symbol libraryName = MirrorSystem.getSymbol('before_export_lib1');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(libraryName);
  LibraryDependencyMirror exportMirror = libraryMirror.libraryDependencies
                                               .firstWhere( (e) => e.isExport );
  Expect.equals('before_export_lib1.A',
      MirrorSystem.getName(exportMirror.metadata[0].type.qualifiedName));
}
