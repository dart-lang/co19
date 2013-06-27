/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const DeferredLibrary(String libraryName, {String uri})
 * @description Checks that DeferredLibrary loads in lazy way.
 * @needsreview #11507
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

@lazy
import 'DeferredLibrary_A01_t01.lib.dart' as foo;

const lazy = const DeferredLibrary('DeferredLibrary_A01_t01.lib');

void main() {
  try {
    foo.method(); // foo is not loaded yet.
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError  catch(ok) {
//    print("NoSuchMethodError catched: $ok");
  }
  asyncStart();
  lazy.load().then(onFooLoaded);
}

void onFooLoaded(_) {
  String name=foo.method();
  Expect.equals('DeferredLibrary_A01_t01.lib', name);
//  print("onFooLoaded ok");
  asyncEnd();
}

