/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IterableMixin<E> abstract class
 * This Iterable mixin implements all Iterable members except iterator.
 * All other methods are implemented in terms of iterator.
 * @compile-error
 * @description Checks that Iterable.iterator is not implemented.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
}
     
main() {
  MyIterable myIterable = new MyIterable();
  Expect.throws( (){myIterable.iterator;} );
}
