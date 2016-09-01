/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion MapBase<K, V>
 * Base class for implementing a Map.
 * This class has a basic implementation of all but five of the members of Map.
 * A basic Map class can be implemented by extending this class and implementing
 * keys, operator[], operator[]=, remove and clear. The remaining operations are
 * implemented in terms of these five.
 * @description Implementation of keys, operator[], operator[]=, remove and
 * clear
 * @author sgrekhov@unipro.ru
 */
library map_base_lib;
import "dart:collection";

class MapBaseImpl<K, V> extends MapBase<K, V> {
  LinkedHashMap<K, V> _map;

  MapBaseImpl(): _map = new LinkedHashMap<K, V>();

  MapBaseImpl.from(Map content): _map = new LinkedHashMap<K, V>.from(content);

  Iterable<K> get keys => _map.keys;
  
  V operator [](Object key) => _map[key];

  void operator []=(K key, V value) {
    _map[key] = value;
  }

  void clear() {
    _map.clear();
  }

  V remove(Object key) => _map.remove(key);
}

