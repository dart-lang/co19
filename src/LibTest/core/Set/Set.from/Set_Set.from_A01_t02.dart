/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set.from(Iterable<E> other)
 * Creates a [Set] that contains all elements of [other].
 * @description Checks that this constructor works correctly with a custom Iterable implementation
 * @author rodionov
 */

class CustomIterator<T> implements Iterator<T> {
  CustomIterator(List list)
  :_array = list, _length = list.length, _pos = 0 { }
  
  bool hasNext() {
    return _length > _pos;
  }

  T next() {
    if (!hasNext()) {
      throw const NoMoreElementsException();
    }
    return _array[_pos++];
  }
  final List<T> _array;
  final int _length;
  int _pos;
}

class IterableClass implements Iterable {
  List internalArray;
  
  Iterator iterator() {
    return new CustomIterator(internalArray);
  }
  
  IterableClass() {
    internalArray = [1, 2, 3];
  }
}

main() {
  Set<int> set = new Set.from(new IterableClass());
  Expect.setEquals(set, [1, 2, 3]);
}
