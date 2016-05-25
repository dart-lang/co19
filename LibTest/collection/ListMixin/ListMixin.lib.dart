/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ListMixin<E> abstract class 
 * Implements List<E>
 * Base implementation of a List class.
 * ListMixin can be used as a mixin to make a class implement the List interface.
 * This implements all read operations using only the length and operator[]
 * members. It implements write operations using those and length= and
 * operator[]=
 * @description Implementation of operator[]= and length=
 * @author sgrekhov@unipro.ru
 */
library list_mixin_lib;
import "dart:collection";

class MyList<E> extends Object with ListMixin<E> {
  List<E> _list;
  
  MyList([int length]): _list = (length == null ? new List() : new List(length));
  
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
  return new MyList(length);
}  
