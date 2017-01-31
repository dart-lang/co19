/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ListBase<E> class
 * Implements ListMixin<E>
 * Abstract implementation of a list.
 * All operations are defined in terms of length, operator[], operator[]= and
 * length=, which need to be implemented.
 * @description Implementation of length, operator[], operator[]= and length=
 * @author sgrekhov@unipro.ru
 */
library list_base_lib;
import "dart:collection";

class ListBaseImpl<E> extends ListBase<E> {
  List<E> _list;
  
  ListBaseImpl([int length]):
        _list = (length == null ? new List() : new List(length));
  
  E operator [](int index) => _list[index];

  void operator []=(int index, E value) {
    _list[index] = value;
  }

  int get length => _list.length;

  void set length(int newLength) {
    _list.length = newLength;
  }
}

List create([int length]) {
  return new ListBaseImpl(length);
}

