/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UnmodifiableMapBase<K, V>
 * Basic implementation of an unmodifiable [Map].
 * This class has a basic implementation of all but two of the members of an
 * umodifiable [Map]. A simple unmodifiable [Map] class can be implemented by
 * extending this class and implementing [keys] and operator[].
 * @description Implementation of [simple UnmodifiableMapBase]
 * @author iarkh@unipro.ru
 */
library unmodifiable_map_base_lib;
import "dart:collection";

class UnmodifiableMapBaseImpl<K, V> extends UnmodifiableMapBase<K, V> {
  LinkedHashMap<K, V> _map;

  UnmodifiableMapBaseImpl(Map content): _map =
      new LinkedHashMap<K, V>.from(content);

  Iterable<K> get keys => _map.keys;
  
  V operator [](Object key) => _map[key];
}
