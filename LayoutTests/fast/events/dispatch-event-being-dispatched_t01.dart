/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that dispatchEvent raises DISPATCH_REQUEST_ERR if the
 * event being dispatched is already being dispatched.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p class="description">
      Tests that dispatchEvent raises DISPATCH_REQUEST_ERR if the event
      being dispatched is already being dispatched.
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBeDispatchRequestErr(exception) {
    shouldBeTrue(exception is DomException);
    shouldBe(exception.name, DomException.INVALID_STATE);
  }

  // try redispatching an event in the process of being dispatched with
  // dispatchEvent

  var redispatchCustom_wasInvoked = false;
  var checkCustom_wasInvoked = false;

  redispatchCustom(event) {
    try {
      window.dispatchEvent(event);
      testFailed('dispatchEvent of an event being dispatched should throw an exception');
    } catch (ex) {
      shouldBeDispatchRequestErr(ex);
    }

    redispatchCustom_wasInvoked = true;
  }

  var customEvent = new Event('foo', canBubble: true, cancelable: true);
  var p = document.querySelector('.description');
  p.addEventListener('foo', redispatchCustom);
  p.dispatchEvent(customEvent);
  shouldBeTrue(redispatchCustom_wasInvoked);

  // try redispatching an event that has already finished being dispatched

  checkCustom(event) {
    checkCustom_wasInvoked = true;
  }

  p.removeEventListener('foo', redispatchCustom, true);
  p.addEventListener('foo', checkCustom, true);
  p.dispatchEvent(customEvent);
  shouldBeTrue(checkCustom_wasInvoked);

  // try redispatching an event in the process of being dispatched by
  // the browser

  var redispatchLoad_dispatching = false;

  redispatchLoad(event) {
    if (redispatchLoad_dispatching) {
      testFailed('dispatchEvent of an event being dispatched should not dispatch the event again');
      return;
    }

    try {
      redispatchLoad_dispatching = true;
      document.dispatchEvent(event);
      testFailed('dispatchEvent of an event being dispatched should throw an exception');
    } catch (ex) {
      shouldBeDispatchRequestErr(ex);
    }

    asyncEnd();
  }

  asyncStart();
  window.addEventListener('load', redispatchLoad, true);
}
