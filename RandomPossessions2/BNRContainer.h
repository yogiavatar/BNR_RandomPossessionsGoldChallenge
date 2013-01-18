//
//  BNRContainer.h
//  RandomPossessions2
//

// BNRContainer is a sub-class of BNRItem


#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *subItems;
    BOOL childContainerExists;
    int childContainerValue;
}


+(id)randomContainerItems;
-(id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:sNumber subItemList:(NSMutableArray*)containerItems;
-(int)totalContainerValue;

-(id)addBNRItem:(BNRItem*)bnrItem;

-(void)setSubItems:(NSMutableArray*)items;
-(NSMutableArray*)subItems;

@end
