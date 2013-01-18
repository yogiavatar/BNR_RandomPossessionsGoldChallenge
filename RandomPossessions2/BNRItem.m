//
//  BNRItem.m
//  RandomPossessions2
//


#import "BNRItem.h"

@implementation BNRItem

+(id)randomItem
{
    // create an array of 3 adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    // create an array of 3 nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand()%10,
                                    'A' + rand()%26,
                                    '0' + rand()%10,
                                    'A' + rand()%26,
                                    '0' + rand()%10];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
    
    
}


// designated initializer
-(id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    [self setItemName:name];
    [self setValueInDollars:value];
    [self setSerialNumber:sNumber];
    dateCreated = [[NSDate alloc]init];
    
    return self;
    
}

-(id)initWithItemName:(NSString*)name
{
    return ([self initWithItemName:name 
                    valueInDollars:0 
                      serialNumber:@""]);
    
}

-(id)init 
{
    return ([self initWithItemName:@"Item" 
                    valueInDollars:0 
                      serialNumber:@""]);
}

-(NSString*)itemName
{
    return itemName;
}

-(void)setItemName:(NSString *)newItemName
{
    itemName = newItemName;
}

-(NSString*)serialNumber
{
    return serialNumber;
}
-(void)setSerialNumber:(NSString*)newSerialNumber
{
    serialNumber = newSerialNumber;
}

-(int)valueInDollars
{
    return valueInDollars;
}
-(void)setValueInDollars:(int)newValueinDollars
{
    valueInDollars = newValueinDollars;
}

//for NSDate object only getter
-(NSDate*)dateCreated
{
    return  dateCreated;
}

-(NSString*)description
{
    NSString* descriptionString = [[NSString alloc] initWithFormat:@"%@  %@: Worth $%d, recorded on %@", itemName, serialNumber, valueInDollars, dateCreated];
    return  descriptionString;
}
@end
