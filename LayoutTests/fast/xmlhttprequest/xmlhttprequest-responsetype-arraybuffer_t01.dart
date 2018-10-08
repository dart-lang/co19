/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests XMLHttpRequest 'arraybuffer' loading with the .responseType and .response attributes.
 * TODO Dartium crashes. Finish the test conversion after it is fixed.  
 */
import "dart:html";
import "dart:typed_data";
import "../../testcommon.dart";

HttpRequest xhr;
var lastState = 0;

void stateChange(e) {
    print('stateChange: ${xhr.readyState}');
    // Protect against race-condition where .onreadystatechange sometimes will be called multiple times for the same state.
    if (xhr.readyState == lastState)
        return;
    lastState = xhr.readyState;
    
    if (xhr.readyState == HttpRequest.DONE) {
        // Check that .response exists when .readyState is DONE
        Expect.isNotNull(xhr.response, "'arraybuffer' .response should exist when .readyState is ${xhr.readyState}.");
    } else {
        // Otherwise, for 'arraybuffer' the .response should not yet exist.
        Expect.equals("", xhr.response, "'arraybuffer' .response should not exist when .readyState is ${xhr.readyState}.");
    }
    print('stateChange end');
}

void logBytesAtOffset(buffer8, offset) {
    var s = "bytes at offset " + offset + " : ";
    for (var i = 0; i < 8; ++i)
        s += buffer8[i + offset].toString(16) + ' ';
    
    print(s);
}

void load(e) {
    print('DONE LOADING');
    print('received response object : ' + xhr.response + ".");

    // Make sure exception is thrown if responseType is set too late in the loading process.
    Expect.throws(() {
        xhr.responseType = "text";
    }
    , null
    , "exception not thrown when xhr.responseType is set to valid value too late in the loading process."
    );

    var buffer = xhr.response;
    print("buffer is ${buffer.runtimeType}");
    // Interpret the ArrayBuffer as Uint8List.
    var buffer8 = new Uint8List.view(buffer);

    var totalLength = buffer8.length;
    debug('response length : $totalLength .');
    
    // Log the bytes at the start, in the middle, and near the end:
    logBytesAtOffset(buffer8, 0);
    logBytesAtOffset(buffer8, 0x5720A);
    logBytesAtOffset(buffer8, 0xA39D6);
    
    // Calculate checksum.
    var sum = 0;
    for (var i = 0; i < totalLength; ++i) {
        sum += buffer8[i];
    }
    
    debug('checksum : $sum');

    // Check that xhr.responseText throws an exception:
    try {
        var x = xhr.responseText;
    } catch(e) {
        testPassed("exception correctly thrown when xhr.responseText is accessed but responseType is 'arraybuffer' : $e .");
    }

    // Check that xhr.responseXML throws an exception:
    try {
        dynamic z = xhr; // avoid compile error 'responseXML' is not defined for the class 'HttpRequest'
        var x = z.responseXML;
    } catch(e) {
        testPassed("exception correctly thrown when xhr.responseXML is accessed but responseType is 'arraybuffer' : $e .");
    }
    
    // Test .response garbage collection.
    xhr.response.foo = "bar";
    gc();
    shouldBe("xhr.response.foo", "'bar'");    

    xhr = null;
    asyncEnd();
}

void main() {

    xhr = new HttpRequest();
    xhr.onReadyStateChange.listen(stateChange);
    xhr.onLoad.listen(load);
    asyncStart();
    xhr.open("GET", "$testSuiteRoot/fast/xmlhttprequest/resources/balls-of-the-orient.aif", async:true);
        
    Expect.equals("", xhr.responseType, "xhr.responseType is not initially set to default value of empty string.");

    // Make sure we can set responseType to valid values before send() is called.
    xhr.responseType = "";
    Expect.equals("", xhr.responseType, "xhr.responseType was not correctly set to ''.");

    xhr.responseType = "text";
    Expect.equals("text", xhr.responseType, "xhr.responseType was not correctly set to 'text'.");

    xhr.responseType = "document";
    Expect.equals("document", xhr.responseType, "xhr.responseType was not correctly set to 'document'.");

    xhr.responseType = "arraybuffer";
    Expect.equals("arraybuffer", xhr.responseType, "xhr.responseType was not correctly set to 'arraybuffer'.");

    xhr.send(null);
}
