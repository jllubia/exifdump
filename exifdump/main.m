//
//  main.m
//  exifdump
//
//  Created by Jorge on 22/10/14.
//  Copyright (c) 2014 Jorge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray * arguments = [[NSProcessInfo processInfo] arguments];
        
        if (arguments.count < 2) {
            printf("\nNeed more arguments");
            return -1;
        }
        
        for (int index = 1; index < arguments.count; index++) {
            NSString * filename = arguments[index];
            printf("\nFile: %s", [filename cStringUsingEncoding: NSUTF8StringEncoding]);

            NSData * imageData = [NSData dataWithContentsOfFile: filename];
            
            if (imageData.length > 0) {
                CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
                if (imageSource != NULL) {
                    NSString * UTIString = (NSString *)CFBridgingRelease(CGImageSourceGetType(imageSource));
                    NSDictionary * imageMetadata = [(NSDictionary *) CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL)) mutableCopy];
                                        
                    printf("\nUTI: %s", [UTIString cStringUsingEncoding: NSUTF8StringEncoding]);
                    printf("\nMetadata: %s", [[imageMetadata description] cStringUsingEncoding: NSUTF8StringEncoding]);
                    
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
