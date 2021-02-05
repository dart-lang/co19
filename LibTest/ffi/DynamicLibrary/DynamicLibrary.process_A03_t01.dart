/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DynamicLibrary.process()
 *  Creates a dynamic library holding all global symbols.
 *
 *  Any symbol in a library currently loaded with global visibility (including
 *  the executable itself) may be resolved in this library.
 *
 *  This feature is not available on Windows, instead an exception is thrown.
 *
 * @description Checks that this constructor creates a dynamic library
 * holding all global symbol
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import 'dart:io';
import "../../../Utils/expect.dart";

void main() {
  if (!Platform.isWindows) {
    DynamicLibrary dl = new DynamicLibrary.process();
    String executable = Platform.resolvedExecutable;
    asyncStart();
    Process.run("nm", ["-gD", executable], runInShell: true)
        .then((ProcessResult res) {
      Expect.equals("", res.stderr);
      List<String> symbols = new List<String>.empty(growable: true);
      res.stdout.split("\n").forEach((element) {
        symbols.add(element.split(" ").last.trim());
      });
      for (String s in symbols) {
        dl.lookup(s);
      }
      asyncEnd();
    });
  }
}
