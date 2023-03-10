// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:collection";

base class MyLinkedListEntry<E> extends LinkedListEntry<MyLinkedListEntry<E>> {
  E value;
  MyLinkedListEntry(this.value);
  
  String toString() {
    return "($value)";
  }
}

