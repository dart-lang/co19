/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set.from(Iterable<E> other)
 * Creates a [Set] that contains all elements of [other].
 * @description Checks that this constructor works correctly with a custom
 * Iterable implementation
 * @author rodionov
 */
import "dart:collection";
import "../../../Utils/expect.dart";

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
  
  Iterator get iterator {
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
