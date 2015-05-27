/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const IterableBase()
 * This class implements all methods of Iterable except Iterable.iterator in terms of iterator.
 * @static-warning
 * @description Checks that Iterable.iterator is not implemented.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends IterableBase {
}
     
main() {
  MyIterable myIterable = new MyIterable();
  Expect.throws( (){myIterable.iterator;} );
}
