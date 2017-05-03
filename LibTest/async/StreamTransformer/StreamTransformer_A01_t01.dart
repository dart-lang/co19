/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamTransformer(StreamSubscription<T>
 *   transformer(Stream<S> stream, bool cancelOnError))
 * Creates a StreamTransformer.
 *
 * The returned instance takes responsibility of implementing (bind). When
 * the user invokes bind it returns a new "bound" stream. Only when the user
 * starts listening to the bound stream, the listen method invokes the given
 * closure transformer.
 *
 * @description Checks that returned instance implements bind.
 * @author ilya
 */
import "dart:async";

main() {
  StreamTransformer tr = new StreamTransformer((stream, cancelOnError) {});
  tr.bind;
}
