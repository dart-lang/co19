/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test verifies that XMLHttpRequest objects has correct default value for its attributes.
 */
import "dart:async";
import "dart:html";
import "../../../Utils/expect.dart";

void main() {
    
    var xhr = new HttpRequest();
    
    Expect.isTrue(xhr.onAbort is Stream, "onAbort");
    Expect.isTrue(xhr.onError is Stream, "onError");
    Expect.isTrue(xhr.onLoad is Stream, "onLoad");
    Expect.isTrue(xhr.onLoadStart is Stream, "onLoadStart");
    Expect.isTrue(xhr.onProgress is Stream, "onProgress");
    Expect.isTrue(xhr.onReadyStateChange is Stream, "onReadyStateChange");
    Expect.equals(0, xhr.readyState, "readyState");
    
    Expect.isTrue(xhr.upload.onAbort is Stream, "upload.onAbort");
    Expect.isTrue(xhr.upload.onError is Stream, "upload.onError");
    Expect.isTrue(xhr.upload.onLoad is Stream, "upload.onLoad");
    Expect.isTrue(xhr.upload.onLoadStart is Stream, "upload.onLoadStart");
    Expect.isTrue(xhr.upload.onProgress is Stream, "upload.onProgress");
    
}