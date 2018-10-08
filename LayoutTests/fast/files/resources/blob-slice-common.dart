library blob_slice_common;

import "dart:html";
import "../../../testcommon.dart";

var sliceTestCases;
var blob, file; // Populated by runTests() in individual tests.
var sliceParams = []; // Populated by individual tests.
var testIndex = 0;

testSlicing(start, end, expectedResult, blob, doneCallback)
{
    var blobClass = blob.runtimeType.toString();
    var sliced;
    var reader = new FileReader();
    var message = ".slice";
    if (start == null && end == null) {
        message += "()";
        sliced = blob.slice();
    } /*else if (end == undefined) {
        message += "(" + start + ")";
        sliced = blob.slice(start);
    }*/ else {
        message += "($start, $end)";
        sliced = blob.slice(start, end);
    }
    reader.onLoadEnd.listen((event) {
        FileReader target = event.target;
        var error = target.error;
        if (error != null) {
            testFailed("File read error $message $error");
            doneCallback();
            return;
        }
        shouldBeEqualToString(target.result, expectedResult);
        doneCallback();
    });
    debug(blobClass + " " + message);
    reader.readAsText(sliced);
}

runNextTest()
{
    if (testIndex >= sliceTestCases.length) {
        asyncEnd();
        return;
    }

    var testCase = sliceTestCases[testIndex];
    testIndex++;
    /*testSlicing(testCase[0], testCase[1], testCase[2], blob, () {
        testSlicing(testCase[0], testCase[1], testCase[2], file, runNextTest);
    });*/
    testSlicing(testCase[0], testCase[1], testCase[2], blob, runNextTest);
}
