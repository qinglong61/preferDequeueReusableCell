//
//  UITableView+Category.m
//
//  Created by 段清伦（qinglong61@163.com） on 2024/12/4.
//

#import "UITableView+Category.h"

@implementation UITableView (Category)

- (void)resortReuseCellQueue:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    NSMutableOrderedSet *cells = [self valueForKey:@"_reusableTableCells"][identifier];
    UITableViewCell *thatCell = nil;
    for (UITableViewCell *xCell in cells) {
        if (xCell.tag == indexPath.section * 1000 + indexPath.row) {
            thatCell = xCell;
            break;
        }
    }
    if (thatCell) {
        [cells removeObject:thatCell];
        [cells insertObject:thatCell atIndex:cells.count];
    }
}

- (__kindof UITableViewCell *)preferDequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    [self resortReuseCellQueue:identifier forIndexPath:indexPath];
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.tag = indexPath.section * 1000 + indexPath.row;
    return cell;
}

@end
