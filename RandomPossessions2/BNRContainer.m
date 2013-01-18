//
//  BNRContainer.m
//  RandomPossessions2
//


#import "BNRContainer.h"

@implementation BNRContainer

// setter for subItems
-(void)setSubItems:(NSMutableArray*)items
{
    subItems = items;
}
// getter for subItems
-(NSMutableArray*)subItems
{
    return subItems;
}

// class method to create array of subItems where each item is of random BNRItem type
+(id)randomContainerItems
{
    NSMutableArray *subItems = [[NSMutableArray alloc] initWithCapacity:3];
    for (int i = 0; i <3; i++) {
        BNRItem *item = [BNRItem randomItem];
        [subItems addObject:item];
    }
    return subItems;
}


-(id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:sNumber subItemList:(NSMutableArray*)containerItems
{
    // call superclass initializer
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    // if successful, initialize the subItems property as well
    if (self)
    {
        [self setSubItems:containerItems];
    }
    return self;
}

// total container value is sum value of container and its subitems
-(int)totalContainerValue
{
    int totalValue = 0;
    //access the container value using super 
    totalValue += [super valueInDollars];
    for (BNRItem *item in [self subItems])
        totalValue += [item valueInDollars];
    return totalValue;
}

-(NSString*)description
{
    NSString *descriptionString = @"\nContainer Info\n";
    
    descriptionString = [descriptionString stringByAppendingFormat:@"Name:%@\n", [self itemName]];
    descriptionString = [descriptionString stringByAppendingFormat:@"Value:%d\nItemList:\n", [super valueInDollars]];
   
    for (BNRItem *item in [self subItems])
    {
        descriptionString = [descriptionString stringByAppendingFormat:@"%@\n", item];
    }
    
    if (childContainerExists) 
    {
        descriptionString = [descriptionString stringByAppendingFormat:@"\nTotal Value of parent(%@) container and its items: %d\n", [super itemName], [self totalContainerValue]];
        childContainerExists = FALSE;
        
    }
    else
    {
        descriptionString = [descriptionString stringByAppendingFormat:@"\nTotal Value of child(%@) container and its items: %d\n",[self itemName], [self totalContainerValue]];  
    }
        
    return descriptionString;                    
                         
}


// This is necessary to add a child container with its own items to a parent containter that has other items apart from the child
-(id)addBNRItem:(BNRItem*)bnrItem
{
    [subItems addObject:bnrItem];
    if ([bnrItem isKindOfClass:[BNRContainer class]]) 
    {
        childContainerExists = TRUE;
    }
    return self;
}

//if the subItem class is BNRContainer (i.e. it is a child container), then over-ride the ValueInDollar method, to calculate its total Value including its subitems
-(int)valueInDollars
{
    childContainerValue=0;
    if(subItems)
    {
        childContainerValue = [super valueInDollars];
        for(BNRItem* item in [self subItems])
            childContainerValue += [item valueInDollars];
    }
    return childContainerValue;
}


@end
