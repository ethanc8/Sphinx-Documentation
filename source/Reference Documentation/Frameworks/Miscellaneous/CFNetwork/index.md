# CFNetwork

Official description:

> Access network services and handle changes in network configurations. Build on abstractions of network protocols to simplify tasks such as working with BSD sockets, administering HTTP and FTP servers, and managing Bonjour services.

> CFNetwork has a number of advantages over BSD sockets. It provides run-loop integration, so if your application is run loop based you can use network protocols without implementing threads. CFNetwork also contains a number of objects to help you use network protocols without having to implement the details yourself. For example, you can use FTP protocols without having to implement all of the details with the CFFTP API. If you understand the networking protocols and need the low-level control they provide but don't want to implement them yourself, then CFNetwork is probably the right choice.

## Apple implementation

* [API documentation](https://developer.apple.com/documentation/cfnetwork?language=objc)
* [Manual](https://developer.apple.com/library/archive/documentation/Networking/Conceptual/CFNetwork/Concepts/Concepts.html)

## Apple implementation open-source forks

* [Apple CFNetwork 129.5 (10.8 Mountain Lion)](https://github.com/apple-oss-distributions/CFNetwork)
* [Darling CFNetwork](https://github.com/darlinghq/darling-cfnetwork)
    * Darling is a project to create a system that can run Mac apps just like Wine can run Windows apps.
* [Open CFNetwork](https://github.com/gerickson/opencfnetwork)

## Cocotron and forks

* [Cocotron CFNetwork](https://github.com/cjwl/cocotron/tree/master/CFNetwork)
* [Airyx CFNetwork](https://github.com/mszoek/airyx/tree/main/Frameworks/CFNetwork)