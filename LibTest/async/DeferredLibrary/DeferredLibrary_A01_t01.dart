/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const DeferredLibrary(String libraryName, {String uri})
 * (from #11507: Lazy library loading is a hint to deployment tools.
 *  The VM is free to ignore this metadata.)
 * @description Checks that DeferredLibrary loads in lazy way.
 * @author kaigorodov
 * @todo move from LibTest to Language
 */

import "../../../Utils/expect.dart";

import 'DeferredLibrary_A01_t01.lib.dart' deferred as lazy;

void main() {
  try {
    lazy.method(); // foo is not loaded yet.
//    Expect.fail("NoSuchMethodError expected"); -- #11507: do not insist on lazy loading
  } on NoSuchMethodError  catch(ok) {
  }
  asyncStart();
  lazy.loadLibrary().then(onFooLoaded);
}

void onFooLoaded(_) {
  String name=lazy.method();
  Expect.equals('DeferredLibrary_A01_t01.lib', name);
  asyncEnd();
}
