/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Pointer<T> lookup <T extends NativeType>(String symbolName)
 *  Looks up a symbol in the DynamicLibrary and returns its address in memory.
 *  Equivalent of dlsym.
 *
 *  Throws an ArgumentError if it fails to lookup the symbol.
 *
 * @description Checks that this method looks up a symbol in the DynamicLibrary
 * and returns its address in memory
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import 'dart:io';
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  if (!Platform.isWindows) {
    final path = libPathAbsolute(TEST_FUNCTIONS_LIB);
    DynamicLibrary dl = new DynamicLibrary.open(path);
    asyncStart();
    Process.run("nm", ["-gDC", path], runInShell: true)
        .then((ProcessResult res) {
      Expect.equals("", res.stderr);
      List<String> symbols = new List<String>.empty(growable: true);
      res.stdout.split("\n").forEach((element) {
        symbols.add(element.split(" ").last.trim());
      });
      for (String s in symbols) {
        print(s);
        dl.lookup(s);
      }
      asyncEnd();
    });
  }
}
