/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a [DoubleLinkedList] that contains all elements of
 * [other].
 * @description Check constructor with custom class
 * @author msyabro
 */

class CustomIterator<T> implements Iterator<T> {
  CustomIterator(Array array)
  :_array = array, _length = array.length, _pos = 0 { }
  
  bool hasNext() {
    return _length > _pos;
  }

  T next() {
    if (!hasNext()) {
      throw const NoMoreElementsException();
    }
    return _array[_pos++];
  }
  final Array<T> _array;
  final int _length;
  int _pos;
}

class IterableClass implements Iterable {
  Array internalArray;
  
  Iterator iterator() {
    return new CustomIterator(internalArray);
  }
  
  IterableClass() {
    internalArray = [1, 2, 3];
  }
}


void check(List l, Collection c) {
  Expect.isTrue(l.length == c.length);
  c.forEach(void compare(var element) {
    Expect.isTrue(l.removeFirst() == element);
  });
}

main() {
  DoubleLinkedList<int> list = new DoubleLinkedList.from(new IterableClass());
  check(list, [1, 2, 3]);
}
