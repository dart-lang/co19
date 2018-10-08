/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests that hashchange events have the expected newURL and oldURL properties. 
 */
import "dart:html";
import "../../testcommon.dart";

String hashOf(String url) {
    int hashIndex = url.lastIndexOf('#');
    return hashIndex != -1 ? url.substring(hashIndex) : '[none]';
}

var goingForward = true;

void onload(e) {
    runLater(() {
        print("setting window.location.href");
        window.location.href = '#state1';
    }, 0);
}

void onhashchange(event) {
    print('hashchange fired with oldURL hash ${hashOf(event.oldUrl)} and newURL hash ${hashOf(event.newUrl)}');
    
    switch (hashOf(event.newUrl)) {
        case '#state1':
            if (goingForward)
                window.location.href = '#state2';
            else
                window.history.back();
            break;
        case '#state2':
            Expect.isTrue(goingForward, 'should always be going forward at #state2');
            asyncEnd();
            break;
        case '[none]':
            asyncEnd();
            break;
    }
}

void main() {
    asyncStart();
    window.onHashChange.listen(onhashchange);
    window.onLoad.listen(onload);
}
