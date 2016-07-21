## DOPDropDownMenu-PK
项目需求以及配合设计的完美方案，在[DOPDropDownMenu-Enhanced](https://github.com/12207480/DOPDropDownMenu-Enhanced)的基础上添加新功能，希望可以帮助到有类似需求的同学，如有任务问题请issuess我:  

* 主要功能支持三级菜单
* 支持选择后保持菜单展开
* 优化三角指示图标颜色设置后收起菜单后复原的问题
* UI展示修改：三角指示动态保持距文字为3

## 应用截图
![image](https://github.com/peanutNote/DOPDropDownMenu-PK/blob/master/DOPDropDownMenu-PK/demo.gif)

![image](https://github.com/peanutNote/DOPDropDownMenu-PK/blob/master/DOPDropDownMenu-PK/demo1.gif)

![image](https://github.com/peanutNote/DOPDropDownMenu-PK/blob/master/DOPDropDownMenu-PK/demo2.gif)

## 用法
与DOPDropDownMenu-Enhanced用法基本一致主要添加一下内容  

```objc
#pragma mark QYNew
/** 新增
 *  当有column列 row 行 item项 返回有多少个单元，如果>0，说明有三级级列表 ，=0 没有三级列表
 *  如果都没有可以不实现该协议
 */
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfUnitsInItem:(NSInteger)item row:(NSInteger)row column:(NSInteger)column;

/** 新增
 *  当有column列 row 行 item项 unit单元 title
 *  如果都没有可以不实现该协议
 */
- (NSString *)menu:(DOPDropDownMenu *)menu titleForUnitsInItemAtIndexPath:(DOPIndexPath *)indexPath;

#pragma mark property_new
// 当有三级列表unit时，点击item 是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveUnitValid;
// 选择后是否让菜单收起
@property (nonatomic, assign) BOOL isKeepDOPMenu;
```
