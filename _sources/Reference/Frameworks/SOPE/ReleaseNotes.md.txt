# Release Notes

SOPE's release versioning is currently in the 5.x series. Before version 5.0, I believe it was wierd.

SOPE 2.x contains security updates and bugfixes to a very old version of SOPE. Release notes for SOPE 2.x are not contained here. SOPE 2.x is only for use in SOGo 2.x, and is not packaged by Debian.

SOPE's last release before Inverse Inc./SOGo forked it was 4.6. The current version is around 4.9 -- this is the version that the `.so` file reports.

## 5.5.1

* fix(appserver): render DAV exceptions as XML
    * sope-appserver/NGObjWeb

## 5.5.0

* fix(imap): improve debugging of EOQualifier
    * sope-mime/NGImap4
* fix(core): improve SSL error log
    * sope-core/NGStreams

## 5.4.0

* Revert "fix(imap): parse message/global structure like message/rfc822"
    * fixes [bug #5453](https://www.sogo.nu/bugs/view.php?id=5453)
* fix(pgsql): add open connection count in debugging output
    * sope-gdl1/PostgreSQL

## 5.3.0

* sope-mime/NGImap4
    * fix(mime): restore SENT-DATE support in EOQualifier
    * fix(imap): parse message/global structure like message/rfc822
    * feat(imap): allow search by keyword
    * feat(imap): add support for UID MOVE operation
    * fix(imap): force envelope subject to return a string
* sope-core/NGExtensions
    * fix(core): don't eat successive LF when decoding quoted printable
        * fixes [bug #5231](https://www.sogo.nu/bugs/view.php?id=5231)
    * core: accept range with no duration in date intersection
* sope-mime/NGMail, sope-mime/NGMime
    * fix(mime): encode text parts individually
        * fixes [bug #5376](https://www.sogo.nu/bugs/view.php?id=5376)

