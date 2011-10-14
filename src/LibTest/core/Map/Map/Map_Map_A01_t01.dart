/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a map with the default implementation.
 * @description Checks that map can be created with key of function type.
 * @needsreview In one of samples in specification declaration of Map
 * is as follows
 * Map<K implements Hashable, V> factory HashMap<K, V>
 * so Map can't be created with arbitrary key,
 * but in current sources declaration is
 * Map<K, V> default HashMap<K, V>
 * @author msyabro
 * @reviewer varlax
 */
 
typedef void SomeFunction();

class A { }


main() {
  Map<String, String> stringStringMap = new Map<String, String>();
  
  Map<SomeFunction, String> funcStringMap = new Map<SomeFunction, String>();
  
  Map<A, A> classClassMap = new Map<A, A>();
}
