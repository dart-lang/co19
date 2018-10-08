/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

Stream makeStream(Iterable iterable, {Function beforeCancel():null}) {
  Stream s = new Stream.fromIterable(iterable);

  return new _StreamWrapper(s, beforeCancel);
}

class _StreamWrapper extends Stream {
  Stream _stream;
  Function _beforeCancel;
  _StreamWrapper(this._stream, this._beforeCancel);

  @override
  StreamSubscription listen(void onData(event),
      {Function onError, void onDone(), bool cancelOnError}) {
    StreamSubscription s =_stream.listen(onData, onError:onError,
        onDone:onDone, cancelOnError: cancelOnError);
    return new _StreamSubscriptionWrapper(s, _beforeCancel);
  }
}

class _StreamSubscriptionWrapper implements StreamSubscription {
  StreamSubscription _streamSubscription;
  Function _beforeCancel;
  _StreamSubscriptionWrapper(this._streamSubscription, this._beforeCancel);

  @override
  Future/*<E>*/ asFuture/*<E>*/([var/*=E*/ futureValue]) {
    return _streamSubscription.asFuture(futureValue);
  }

  @override
  Future cancel() {
    if (_beforeCancel != null ) {
      _beforeCancel();
    }
    return _streamSubscription.cancel();
  }

  @override
  bool get isPaused => _streamSubscription.isPaused;

  @override
  void onData(void handleData(data)) {
    _streamSubscription.onData(handleData);
  }

  @override
  void onDone(void handleDone()) {
    _streamSubscription.onDone( handleDone);
  }

  @override
  void onError(Function handleError) {
    _streamSubscription.onError(handleError);
  }

  @override
  void pause([Future resumeSignal]) {
    _streamSubscription.pause(resumeSignal);
  }

  @override
  void resume() {
    _streamSubscription.resume();
  }
}

