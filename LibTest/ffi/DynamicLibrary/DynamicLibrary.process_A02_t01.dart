// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion DynamicLibrary.process()
 *  Creates a dynamic library holding all global symbols.
 *
 *  Any symbol in a library currently loaded with global visibility (including
 *  the executable itself) may be resolved in this library.
 *
 *  This feature is not available on Windows, instead an exception is thrown.
 *
 * @description Checks that this throws an exception on Windows
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import 'dart:io' show Platform;
import "../../../Utils/expect.dart";

void main() {
  if (Platform.isWindows) {
    Expect.throws(() {
      new DynamicLibrary.process();
    });
  }
}
