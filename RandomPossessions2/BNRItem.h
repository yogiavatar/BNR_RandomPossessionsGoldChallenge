//
//  BNRItem.h
//  RandomPossessions2
//


#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}
//class method
+(id)randomItem;


// getter
-(NSString*)itemName;
// setter
-(void)setItemName:(NSString*)newItemName;

-(NSString*)serialNumber;
-(void)setSerialNumber:(NSString*)newSerialNumber;

-(int)valueInDollars;
-(void)setValueInDollars:(int)newValueinDollars;

//for NSDate object only getter
-(NSDate*)dateCreated;

//initializers

//designated initializer
-(id)initWithItemName:(NSString*)name
       valueInDollars:(int)value
         serialNumber:(NSString*)sNumber;

-(id)initWithItemName:(NSString*)name;
-(id)init;

@end
