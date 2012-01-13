/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a [Queue] that contains all elements of
 * [other].
 * @description Checks constructor with custom Iterable.
 * @author msyabro
 * @reviewer varlax
 * @reviewer iefremov
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


void check(Queue l, Collection c) {
  Expect.isTrue(l.length == c.length);
  c.forEach(void compare(var element) {
    Expect.isTrue(l.removeFirst() == element);
  });
}

main() {
  Queue<int> list = new Queue.from(new IterableClass());
  check(list, [1, 2, 3]);

  IterableClass copy = new IterableClass();
  copy.internalArray = [null,null,"sdsd",copy];
  check(new Queue.from(copy), [null,null,"sdsd",copy]);
}
