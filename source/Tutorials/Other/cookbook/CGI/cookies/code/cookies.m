
#include <Foundation/Foundation.h>

#define PERSIST 30

@interface NSMutableDictionary (Cookies)

- (NSMutableDictionary *)initWithCookie;
- (NSString *)cookieToString;

@end

@implementation NSMutableDictionary (Cookies)

- (id)initWithCookie
{
    NSString *cookie = 
        [[[NSProcessInfo processInfo] environment]
            objectForKey:@"HTTP_COOKIE"];

    [self initWithCapacity:1];

    if(cookie!=nil){
        NSCharacterSet *space =
            [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSScanner *scn = 
            [NSScanner scannerWithString:cookie];

        while([scn isAtEnd]==NO){
            NSString *pair;
            if([scn scanUpToString:@";" intoString:&pair]==YES){
                NSArray *entry = 
                    [pair componentsSeparatedByString:@"="];
                NSString *key, *value;

                if([entry count]!=2){
                    [NSException 
                        raise:NSRangeException 
                        format:@"cookie \"%@\""
                        @"contains bad key-value pair; "
                        @"%d fields, should be 2; ",
                        cookie, [entry count]];
                }

                key = [entry objectAtIndex:0];
                value = [entry objectAtIndex:1];

                if(![key length] || ![value length]){
                    [NSException 
                        raise:NSRangeException 
                        format:@"cookie \"%@\":"
                        @"key and value must not be empty;"
                        @"got lengths %d (key) and %d (value).", 
                        cookie, [key length], [value length]];
                }

                [self setObject:value forKey:key];

                [scn scanString:@";" intoString:NULL];
                [scn scanCharactersFromSet:space  
                     intoString:NULL];
            }
        }
    }

    return self;
}

- (NSString *)cookieToString
{
    NSMutableArray *data = 
        [NSMutableArray arrayWithCapacity:1];
    NSMutableArray *properties =
        [NSMutableArray arrayWithCapacity:1];
    BOOL secure = NO;
    
    NSString *field;

    NSEnumerator *keyEnum = [self keyEnumerator];
    NSString *key;
    while((key=[keyEnum nextObject])!=nil){
        if([key isEqualToString:@"domain"]==YES ||
           [key isEqualToString:@"path"]==YES){
            field = 
                [NSString stringWithFormat:@"%@=%@;",
                          key, [self objectForKey:key]];
            [properties addObject:field];
        }
        else if([key isEqualToString:@"expires"]==YES){
           NSString *dateStr =
               [[self objectForKey:key] 
                   descriptionWithCalendarFormat:@"%a, %d-%b-%Y "
                   @"%H:%M:%S GMT" 
                   timeZone:[NSTimeZone timeZoneWithName:@"GMT"]
                   locale:nil];
            field = 
                [NSString stringWithFormat:@"%@=%@;",
                          key, dateStr];
            [properties addObject:field];
        }
        else if([key isEqualToString:@"secure"]==YES){
            secure = YES;
        }
        else{
            field =  
                [NSString stringWithFormat:@"%@=%@;",
                          key, [self objectForKey:key]];
            [data addObject:field];
        }
    }

    NSString *props = 
        [properties componentsJoinedByString:@" "];
    if(secure==YES){
        props = [props stringByAppendingString:@" secure"];
    }

    NSString *result = @"", *line;
    NSEnumerator *lineEnum = [data objectEnumerator];
    while((line=[lineEnum nextObject])!=nil){
        NSString *allFields =
            [NSString 
                stringWithFormat:@"Set-Cookie: %@ %@\r\n", 
                line, props];
        result = 
            [result stringByAppendingString:allFields];
    }

    return result;
}

@end

#define NEWKEYS 2

int main(int argc, char** argv, char **env)
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];

    NSMutableDictionary *cookieValues =
        [[NSMutableDictionary alloc] initWithCookie];

    NSDate *date = 
        [NSDate dateWithTimeIntervalSinceNow:PERSIST];

    NSMutableDictionary *newCookie = 
        [NSMutableDictionary 
            dictionaryWithObjectsAndKeys:date, @"expires",
            @"/cgi-bin/cookies.sh", @"path", nil];
   
    long now = time(NULL); int k;
    srand48(now);

    for(k=0; k<NEWKEYS; k++){
        NSString 
            *key = 
            [NSString stringWithFormat:@"k%04ld%03d",
                      now%10000, k],
            *value = 
            [NSString stringWithFormat:@"%ld",
                      now];
        [newCookie setObject:value forKey:key];
    }
    
    printf("%s", [[newCookie cookieToString] cString]);
    printf("Content-type: text/html\r\n\r\n");

    printf("<HTML><HEAD><TITLE>Cookies</TITLE></HEAD><BODY>\n");

    NSEnumerator *en;
    NSString *key, *value;

    int count = 1;
    long rem;

    puts("<PRE>");

    printf("Received:\n%s\n\n\n", 
           [[cookieValues cookieToString] cString]);

    en = [[[cookieValues allKeys]
              sortedArrayUsingSelector:@selector(compare:)]
             objectEnumerator];
    while((key = [en nextObject])!=nil){
        value =  [cookieValues objectForKey:key];
	rem = (long)PERSIST-(now-atol([value cString]));

        NSString *item =
	    [NSString stringWithFormat:@"key %d: %@\n"
                      @"value %d: %@\n"
                      @"remaining %d: %lds\n",
		      count, key, count, value,
                      count, rem];

	printf("%s\n", [item cString]);
	count++;
    }

    printf("%s receive a cookie.\n\n\n",
           ([cookieValues count]? "Did" : "Did not"));
    printf("%s\n", [[newCookie cookieToString] cString]);
    

    puts("</PRE>");

    printf("<FORM ACTION=cookies.sh METHOD=GET>\n"
           "<INPUT TYPE=SUBMIT VALUE=Submit>\n"
           "</FORM>\n");

    printf("</BODY></HTML>\n");

    [pool release];
    exit(0);
}
