/**
 * after web-platform-tests/webstorage/event_local_storageeventinit.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description storageeventinit test
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    void onStorageEvent(event) {
        assert_equals(event.key, 'key');
        assert_equals(event.oldValue, 'oldValue');
        assert_equals(event.newValue, 'newValue');
        assert_equals(event.url, window.location.href);
        assert_equals(event.storageArea, window.localStorage);
        asyncEnd();
    }

    window.localStorage.clear();
    window.addEventListener('storage', onStorageEvent, false);
    var event = new StorageEvent('storage', 
        key: 'key',
        oldValue: 'oldValue',
        newValue: 'newValue',
        url: window.location.href,
        storageArea: window.localStorage
    );

    asyncStart();
    window.dispatchEvent(event);
}
