// This is the solution for Gold challenge Chapter 2 of iOS Programming: The Big Nerd Ranch Guide, Third Edition

//  Challenge: Create a subclass of BNRItem named BNRContainer. A BNRContainer should have an array of subitems that contains instances of BNRItem. Printing the description of a BNRContainer should show you the name of the container, its value in dollars (a sum of all items in the container plus the value of the container itself), and a list of every BNRItem it contains. A properly-written BNRContainer can contain instances of BNRContainer. It can also report back its full value and every contained item properly.

//
//  main.m
//  RandomPossessions2
//
// GitCommit


#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {

    
        BNRContainer *container = [[BNRContainer alloc] initWithItemName:@"Container1" valueInDollars:50 serialNumber:@"WERSD" subItemList:[BNRContainer randomContainerItems]];
        
        BNRContainer *childContainer1 = [[BNRContainer alloc] initWithItemName:@"Child_1_Of_Container1" valueInDollars:23 serialNumber:@"WERSDC1" subItemList:[BNRContainer randomContainerItems]];
    
        BNRContainer *childContainer2 = [[BNRContainer alloc] initWithItemName:@"Child_11_Of_Container1" valueInDollars:10 serialNumber:@"WERSDC2" subItemList:[BNRContainer randomContainerItems]];
        
        [container addBNRItem:childContainer1];
        
        
        // Both the scenarios below work   
        //scenario 1: One parent container with 2 child containers
        [container addBNRItem:childContainer2]; 
        
        //scenario 2: one parent container, with one child container, which also has a child container of itself 
        //[childContainer1 addBNRItem:childContainer2];  
        
        NSLog(@"%@",container);
        
        container = nil;

        
        
    }
    return 0;
}

