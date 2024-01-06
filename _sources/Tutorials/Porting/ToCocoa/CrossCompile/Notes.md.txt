# Notes

* [OSXCross project](https://github.com/tpoechtrager/osxcross)


## Tutorials

* [For Rust from Ubuntu](https://wapl.es/rust/2019/02/17/rust-cross-compile-linux-to-macos.html)
* [Another Rust tutorial](https://libreddit.kavin.rocks/r/rust/comments/6rxoty/tutorial_cross_compiling_from_linux_for_osx/)
* [For the Sduino project](https://tenbaht.github.io/sduino/developer/cross-compile-for-osx/)
* [For PyInstalller](https://pyinstaller.readthedocs.io/en/v4.9/bootloader-building.html#cross-building-for-mac-os-x)
* [For Godot](https://docs.godotengine.org/en/stable/development/compiling/compiling_for_osx.html#cross-compiling-for-macos-from-linux)

## SDK

The SDK can be found here:

* https://github.com/joseluisq/macosx-sdks - designed for OSXCross
* https://github.com/phracker/MacOSX-SDKs - has some issues with older SDKs
* https://github.com/JuliaEichler/Mac_OSX_SDKs - 10.6 and 10.7
* https://github.com/AaronWallace/MacOSX_SDKs - 10.6~10.11

## Bypassing Gatekeeper

You currently can't notarize the app from GNU/Linux. However, the app does not need to be signed or notarized if it was downloaded using `curl` or `wget`, or if it was embedded in an RTF.

* [`curl` workaround](https://lapcatsoftware.com/articles/without-notarization.html)
* [TextEdit workaround](https://lapcatsoftware.com/articles/textedit-gatekeeper.html)
* [User experience without workaround, and ad-hoc signing workaround](https://lapcatsoftware.com/articles/unsigned.html)
* [OSXCross signing and notarization issue](https://github.com/tpoechtrager/osxcross/issues/198)

## Other Architectures

### x86 (32-bit)

You need the Xcode 9.4.1 SDK.

### PowerPC

* [See this issue](https://github.com/tpoechtrager/osxcross/issues/50#issuecomment-149013354)

### ARM / Apple Silicon


