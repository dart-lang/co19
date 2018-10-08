/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
    <div>
    This test checks to make sure the hashchange event is fired __ansynchronously__ when the value of location.hash changes.<br/>
    It assumes there is a hashchange event for each location.hash change.<br/>
    <br/>
    </div>
    <div id="msg"></div>
''';

var hashChanging = false;

void updateHash (hash) {
    print('updateHash($hash)');
    window.location.href = hash;
}

void loadHandler (e) {
    hashChanging = true;
    updateHash('#foo');
    updateHash('#bar');
    hashChanging = false;
}

var cnt = 0;

void hashChangeHandler (e) {
    Expect.isFalse(hashChanging);
    if (++cnt >= 2) {
        asyncEnd();
    }
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.addEventListener('load', loadHandler, false);
    window.addEventListener('hashchange', hashChangeHandler, false);
}
