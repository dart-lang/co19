/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before a library, ...
 * @description Check that metadata is allowed before library token.
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

import 'before_library_lib1.dart';


main() {
  Symbol libraryName = MirrorSystem.getSymbol('before_library_lib1');
  var metadata = currentMirrorSystem().findLibrary(libraryName).metadata;
  Expect.equals('before_library_lib1', metadata[0].reflectee.expires);
}
