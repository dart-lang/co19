/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ListQueue.from(Iterable elements)
 * Create a [ListQueue] containing all [elements].
 * The elements are added to the queue, as by [addLast], in the order given by
 * [elements.iterator].
 * @description Checks constructor with a custom [Iterable].
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class CustomIterator<T> implements Iterator<T> {
  CustomIterator(List<T> list)
  :_array = list, _length = list.length, _pos = -1 { }
  
  bool moveNext() {
    if(_pos + 1 < _length) {
      _pos++;
      return true;
    } else {
      return false;
    }
  }

  T get current {
    if (_pos < 0) {
      throw new StateError("No element selected yet, use moveNext()");
    }
    
    if(_pos >= _length) {
      throw new StateError("Impossible: current position >= length.");
    }
    
    return _array[_pos];
  }
  
  final List<T> _array;
  final int _length;
  int _pos;
}

class IterableClass extends IterableBase {
  List internalArray;
  
  IterableClass() {
    internalArray = [1, 2, 3];
  }
  
  Iterator get iterator {
    return new CustomIterator(internalArray);
  }
}


void check(ListQueue l, Iterable c) {
  Expect.equals(l.length, c.length);
  c.forEach((var element) {
    Expect.equals(l.removeFirst(), element);
  });
}

main() {
  ListQueue<int> list = new ListQueue.from(new IterableClass());
  check(list, [1, 2, 3]);

  IterableClass copy = new IterableClass();
  copy.internalArray = [null, null, "sdsd", copy];
  check(new ListQueue.from(copy), [null, null, "sdsd", copy]);
}
