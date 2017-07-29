//
//  main.m
//  exifdump
//
//  Created by Jorge on 22/10/14.
//  Copyright (c) 2014 Jorge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>

#define VERSION_NUMBER "1.1"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray * arguments = [[NSProcessInfo processInfo] arguments];
        
        if (arguments.count < 2) {
            printf("Usage: exifdump file ...\n");
            return -1;
        }
        
        if (arguments.count == 2 && [arguments[1] isEqualToString:@"--version"]) {
            printf("%s\n", VERSION_NUMBER);
            return 0;
        }
        
        for (int index = 1; index < arguments.count; index++) {
            
            NSString * filename = arguments[index];
            if (![[NSFileManager defaultManager] fileExistsAtPath: filename]) {
                printf("Could not open '%s'\n", [filename cStringUsingEncoding: NSUTF8StringEncoding]);
                continue;
            }

            printf("File: %s", [filename cStringUsingEncoding: NSUTF8StringEncoding]);

            NSData * imageData = [NSData dataWithContentsOfFile: filename];
            
            if (imageData.length > 0) {
                CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
                if (imageSource != NULL) {
                    NSString * UTIString = (NSString *)CFBridgingRelease(CGImageSourceGetType(imageSource));
                    NSMutableDictionary * imageMetadata = [(NSDictionary *) CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL)) mutableCopy];
                    NSDictionary * additionalMetadata = [(NSDictionary *) CFBridgingRelease(CGImageSourceCopyProperties(imageSource, NULL)) copy];
                    [imageMetadata addEntriesFromDictionary: additionalMetadata];

                    printf("\nUTI: %s", [UTIString cStringUsingEncoding: NSUTF8StringEncoding]);
                    printf("\nMetadata: %s\n", [[imageMetadata description] cStringUsingEncoding: NSUTF8StringEncoding]);
                    
                    CFRelease(imageSource);
                } else {
                    printf("\nCould not process %s", [filename cStringUsingEncoding: NSUTF8StringEncoding]);
                }
            } else {
                printf("\nDid not get data...");
            }
        }
        
    }
    return 0;
}
