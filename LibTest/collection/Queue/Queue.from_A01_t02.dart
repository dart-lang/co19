/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Queue.from(Iterable elements)
 * Creates a queue containing all elements.
 * The element order in the queue is as if the elements were added using
 * [addLast] in the order provided by [elements.iterator].
 * @description Checks constructor with custom [Iterable].
 * @author msyabro
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


void check(Queue l, Iterable c) {
  Expect.equals(l.length, c.length);
  c.forEach((var element) {
    Expect.equals(l.removeFirst(), element);
  });
}

main() {
  Queue<int> list = new Queue.from(new IterableClass());
  check(list, [1, 2, 3]);

  IterableClass copy = new IterableClass();
  copy.internalArray = [null, null, "sdsd", copy];
  check(new Queue.from(copy), [null, null, "sdsd", copy]);
}
