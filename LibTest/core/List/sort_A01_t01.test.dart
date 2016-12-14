/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void sort([int compare(E a, E b)])
 * Sorts the list according to the order specified by the compare function.
 * The compare function must act as a Comparator.
 * The default List implementations use Comparable.compare if compare is omitted.
 * @description Sort empty list without comparator
 * @author iefremov
 */
library sort_A01_t01;

test(List create([int length])) {
  create().sort(null);    
}
