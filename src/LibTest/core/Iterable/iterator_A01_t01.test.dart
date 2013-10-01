/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterator<E> iterator
 * Returns an [Iterator] that iterates over this [Iterable] object.
 * @description Checks that the returned [Iterator] iterates all elements of the list.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
library iterator_A01_t01;
 
import "../../../Utils/expect.dart";
import "../Iterator/allTests.lib.dart" as libIterator;

test(Iterable create([Iterable content]), {bool isSet:false}) {
  libIterator.test(create, isSet:isSet);  
}
