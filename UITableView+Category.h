//
//  UITableView+Category.h
//
//  Created by 段清伦（qinglong61@163.com） on 2024/12/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Category)

- (__kindof UITableViewCell *)preferDequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
