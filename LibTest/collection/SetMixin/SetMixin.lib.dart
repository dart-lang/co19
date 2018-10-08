/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class SetMixin<K, V>
 * Mixin implementation of Set.
 * This class provides a base implementation of a Set that depends only on the
 * abstract members: [add], [contains], [lookup], [remove], [iterator], [length]
 * and [toSet].
 * @description Implementation of [add], [contains], [lookup], [remove],
 * [iterator], [length] and [toSet].
 * @author sgrekhov@unipro.ru
 */
library set_mixin_lib;
import "dart:collection";

class SetMixinImpl<E> extends Object with SetMixin<E> {
  LinkedHashSet<E> _set;

  SetMixinImpl(): _set = new LinkedHashSet<E>();

  SetMixinImpl.from(Iterable content): _set =
      new LinkedHashSet<E>.from(content);

  bool add(E element) => _set.add(element);

  bool contains(Object element) => _set.contains(element);

  E lookup(Object element) => _set.lookup(element);

  bool remove(Object element) => _set.remove(element);

  Iterator<E> get iterator => _set.iterator;

  int get length => _set.length;

  Set<E> toSet() => _set.toSet();
}

Set create([Iterable content]) {
  if (content == null) {
    return new SetMixinImpl();
  } else {
    return new SetMixinImpl.from(content);
  }
}
