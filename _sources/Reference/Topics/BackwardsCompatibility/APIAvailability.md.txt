# Specifying API Availability - the GNUstep way

## Specifying API availability of Apple or NeXT APIs

### Introduced before NeXT OPENSTEP 4.0

There is no macro for the first releases of Foundation, so you can use a number between `0` (meaning not available) and `GS_API_OSSPEC`, which is currently `10000`.

Note that the GNUstep libraries usually just say that they were introduced in OpenStep or NeXT OPENSTEP 4.0.

```objc
#if OS_API_VERSION(1, GS_API_LATEST)
    // Your APIs
#endif
```

### Available in the OpenStep specification

```objc
#if OS_API_VERSION(GS_API_OSSPEC, GS_API_LATEST)
    // Your APIs
#endif
```

### Available in OPENSTEP for Mach (NeXT OPENSTEP)

```objc
#if OS_API_VERSION(GS_API_OPENSTEP, GS_API_LATEST)
    // Your APIs
#endif
```

### Introduced in NeXT OPENSTEP 4.x or Rhapsody

You can represent them with some number greater than `GS_API_OPENSTEP`, which is currently `40000` (40 thousand -- 4.00.00).

The best way to do this, since `GS_API_OPENSTEP` is 4.00.00, is to set them like this:

| OS version | Marketing version          | Codename   | Build number     | Version to put into `OS_API_VERSION` |
| ---------- | -------------------------- | ---------- | ---------------- | ------------------------------------ |
| 4.0        |                            |            |                  | 4 00 00                              |
| 4.1        |                            |            |                  | 4 01 00                              |
| 4.2        |                            |            |                  | 4 02 00                              |
| 5.0        | Rhapsody Developer Release | Grail 1Z4  | v322 (Workspace) | 5 00 00                              |
| 5.1        | Rhapsody DR 2              | Titan 1U   | v341             | 5 01 00                              |
| 5.3        | Mac OS X Server 1.0,0      | Hera 1O9   |                  | 5 03 00                              |
| 5.4        | Mac OS X Server 1.0.1      | Hera 1O9   | v375             | 5 04 00                              |
| 5.5        | Mac OS X Server 1.0.2      | Loki 2G1   |                  | 5 05 00                              |
| 5.6        | Mac OS X Server 1.2        | Pele 1Q10  |                  | 5 06 00                              |
| 5.6        | Mac OS X Server 1.2v3      | Medusa 1E3 |                  | 5 06 03                              |

### Introduced in Mac OS X developer preview or Kodiak public beta

You can represent them with some number greater than `GS_API_OPENSTEP`, which is currently 4 00 00.

The best way to do this, since `GS_API_OPENSTEP` is 4 00 00, is to set them like this:

| OS version | Marketing version | Codename | Build number | Version to put into `OS_API_VERSION` |
| ---------- | ----------------- | -------- | ------------ | ------------------------------------ |
|            | Developer Preview | Beaker 1N5         | v521         | 9 01 00                              |
|            | DP 2              |          |              | 9 02 00                              |
|            | DP 3              |          |              | 9 03 00                              |
|            | DP 4              |          |              | 9 04 00                              |
|            | Public Beta       | Kodiak   | 1H39             | 9 05 00                              |


### Removed in Mac OS X, present in OpenStep



### Available in all Mac OS X versions

```objc
#if OS_API_VERSION(GS_API_MACOSX, GS_API_LATEST)
    // Your APIs
#endif
```

### Introduced in Mac OS X 10.x

```{warning}
The macros for the different Mac OS X versions are clearly incorrect, as they are *lower* than `GS_API_MACOSX`.
```

The GNUstep libraries use the following:

```objc
#if OS_API_VERSION(MAC_OS_X_VERSION_10_8, GS_API_LATEST)
    // Your APIs
#endif
```

The theoretically correct way to do this is:

```objc
#if OS_API_VERSION(100800, GS_API_LATEST)
    // Your APIs
#endif
```

literally 10.08.00

However, `autogsdoc` might not recognize this.
